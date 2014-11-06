
//
//  WCMViewController.m
//  MapDrawTest
//
//  Created by Michael McNally on 10/6/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//
#import <GoogleMaps/GoogleMaps.h>
#import "WCMViewController.h"
#import "WCMGPSPoints.h"
#import "WCMDatabase.h"

@interface WCMViewController ()

//@property (nonatomic,weak) IBOutlet UILabel *satillite;


@end

@implementation WCMViewController{
    GMSMapView *mapView_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Create a GMSCameraPosition that tells the map to display the
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.298409
                                                            longitude:-74.867093
                                                                 zoom:15];
    CGRect bounds = CGRectMake( 0, 0, 2048, 1536);
    mapView_ = [GMSMapView mapWithFrame:bounds camera:camera];
    mapView_.myLocationEnabled = YES;
    [self.view insertSubview:mapView_ atIndex:0];
    /*   NSMutableArray *lat = [NSMutableArray array];
     NSMutableArray *lon = [NSMutableArray array];
     
     NSString* filePath = [[NSBundle mainBundle] pathForResource:@"greenFromRiver"
     ofType:@"csv"];
     
     // NSString *pathName = @"Locations/greenFromRiver.csv";  /// fill in the file's pathname
     NSFileManager *fm = [NSFileManager defaultManager];
     if ([fm fileExistsAtPath:filePath]) {
     NSString *lines = [NSString stringWithContentsOfFile:filePath];
     
     
     
     NSArray* rows = [lines componentsSeparatedByString:@"\n"];
     for (NSString *row in rows){
     NSArray* columns = [row componentsSeparatedByString:@","];
     [lat addObject:columns[0]];
     [lon addObject:columns[1]];
     }
     
     } */
    
    
    GMSMutablePath *path = [GMSMutablePath path];
    
    NSArray *YellowPoints = [WCMDatabase database].YellowTrailPoints;
    int i=0;
    for (WCMGPSPoints *points in YellowPoints)
    {
        while(i < 209){ //try to find better iterator method
            double temparyLat= [points.latitude[i] doubleValue];
            double temparyLon= [points.longitude[i] doubleValue];
            [path addCoordinate:CLLocationCoordinate2DMake(temparyLat,temparyLon)];
            i++;
        }
    }
    
    
    
    /* for(int i=0;i<200;i++){
     double temparyLat= [lat[i] doubleValue];
     double temparyLon= [lon[i] doubleValue];
     [path addCoordinate:CLLocationCoordinate2DMake(temparyLat,temparyLon)];
     }*/
    
    GMSPolyline *basic1Route = [GMSPolyline polylineWithPath:path];
    basic1Route.geodesic=YES;
    basic1Route.strokeColor = [UIColor yellowColor];
    mapView_.mapType = kGMSTypeTerrain;
    basic1Route.map = mapView_;
    
    
    GMSMutablePath *Bluepath = [GMSMutablePath path];
    
    NSArray *BluePoints = [WCMDatabase database].BlueTrailPoints;
   i=0;
    for (WCMGPSPoints *points in BluePoints)
    {
        while(i < 789){ //try to find better iterator method
            double temparyLat= [points.latitude[i] doubleValue];
            double temparyLon= [points.longitude[i] doubleValue];
            [Bluepath addCoordinate:CLLocationCoordinate2DMake(temparyLat,temparyLon)];
            i++;
        }
    }
    
    
    
    GMSPolyline *basic2Route = [GMSPolyline polylineWithPath:Bluepath];
    basic2Route.geodesic=YES;
    basic2Route.strokeColor = [UIColor blueColor];
    
    basic2Route.map = mapView_;
    
    GMSMutablePath *Greenpath = [GMSMutablePath path];
    
    NSArray *GreenPoints = [WCMDatabase database].GreenTrailPoints;
    i=0;
    for (WCMGPSPoints *points in GreenPoints)
    {
        while(i < 290){ //try to find better iterator method
            double temparyLat= [points.latitude[i] doubleValue];
            double temparyLon= [points.longitude[i] doubleValue];
            [Greenpath addCoordinate:CLLocationCoordinate2DMake(temparyLat,temparyLon)];
            i++;
        }
    }
    
    
    
    GMSPolyline *basic3Route = [GMSPolyline polylineWithPath:Greenpath];
    basic3Route.geodesic=YES;
    basic3Route.strokeColor = [UIColor greenColor];
    basic3Route.map = mapView_;
    
    GMSMutablePath *Redpath = [GMSMutablePath path];
    
    NSArray *RedPoints = [WCMDatabase database].RedTrailPoints;
    i=0;
    for (WCMGPSPoints *points in RedPoints)
    {
        while(i < 401){ //try to find better iterator method
            double temparyLat= [points.latitude[i] doubleValue];
            double temparyLon= [points.longitude[i] doubleValue];
            [Redpath addCoordinate:CLLocationCoordinate2DMake(temparyLat,temparyLon)];
            i++;
        }
    }
    
    
    
    GMSPolyline *basic4Route = [GMSPolyline polylineWithPath:Redpath];
    basic4Route.geodesic=YES;
    basic4Route.strokeColor = [UIColor redColor];
    basic4Route.map = mapView_;


    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)sattiliteSwitch:(id)sender{
    if(mapView_.mapType == kGMSTypeTerrain){
        mapView_.mapType = kGMSTypeSatellite;
    }else{
        mapView_.mapType = kGMSTypeTerrain;
    }
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.tabBarItem.title = @"Trail Viewer";
        
        UIImage *image = [UIImage imageNamed:@"trailLogo.jpg"];
        
        self.tabBarItem.image = image;
    }
    return self;
}


@end

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

@end

@implementation WCMViewController{
    GMSMapView *mapView_;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.298409
                                                            longitude:-74.867093
                                                                 zoom:15];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
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
    
    NSArray *GPSPoints = [WCMDatabase database].GPSPoints;
    int i=0;
    for (WCMGPSPoints *points in GPSPoints)
    {
        while(i < 1689){ //try to find better iterator method
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
    
    GMSPolyline *basicRoute = [GMSPolyline polylineWithPath:path];
    basicRoute.geodesic=YES;
    basicRoute.strokeColor = [UIColor greenColor];
    mapView_.mapType = kGMSTypeTerrain;
    basicRoute.map = mapView_;
    

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

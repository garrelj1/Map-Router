//
//  WCMSplashViewController.m
//  MapDrawTest
//
//  Created by Jeremy Garrell on 11/4/14.
//  Copyright (c) 2014 Jeremy Garrell. All rights reserved.
//

#import "WCMSplashViewController.h"
#import "WCMSplashView.h"

@interface WCMSplashViewController ()

@end

@implementation WCMSplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create a view
    CGRect backgroundFrame = [UIScreen mainScreen].bounds;
    
    WCMSplashView *splashView = [[WCMSplashView alloc] initWithFrame:backgroundFrame];
    splashView.backgroundColor = [UIColor grayColor];
    
    self.view = splashView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.tabBarItem.title = @"Main Menu";
        
        UIImage *image = [UIImage imageNamed:@"MMlogo.png"];
        
        self.tabBarItem.image = image;
    }
    return self;
}

@end

//
//  WCMAppDelegate.m
//  MapDrawTest
//
//  Created by Michael McNally on 10/6/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "WCMAppDelegate.h"
#import "WCMViewController.h"
#import "WCMGPSPoints.h"
#import "WCMDatabase.h"

#import "WCMSplashViewController.h"

@implementation WCMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*
    NSLog(@"The application has finished loading and will now run more code");
    
    NSArray *GPSPoints = [WCMDatabase database].GPSPoints;
    for (WCMGPSPoints *points in GPSPoints)
    {
        NSLog(@"Points in table TGPS_Points");
        NSLog(@"array: %@", points.latitude);
        NSLog(@"array: %@", points.longitude);
    }
    
    NSArray *RedTrailPoints = [WCMDatabase database].RedTrailPoints;
    for (WCMGPSPoints *points in RedTrailPoints)
    {
        NSLog(@"Points in table TRed_trail");
        NSLog(@"array: %@", points.latitude);
        NSLog(@"array: %@", points.longitude);
    }
    
    NSArray *BlueTrailPoints = [WCMDatabase database].BlueTrailPoints;
    for (WCMGPSPoints *points in BlueTrailPoints)
    {
        NSLog(@"Points in table TBlue_trail");
        NSLog(@"array: %@", points.latitude);
        NSLog(@"array: %@", points.longitude);
    }
    
    NSArray *GreenTrailPoints = [WCMDatabase database].GreenTrailPoints;
    for (WCMGPSPoints *points in GreenTrailPoints)
    {
        NSLog(@"Points in table TGreen_trail");
        NSLog(@"array: %@", points.latitude);
        NSLog(@"array: %@", points.longitude);
    }
    
    NSArray *YellowTrailPoints = [WCMDatabase database].YellowTrailPoints;
    for (WCMGPSPoints *points in YellowTrailPoints)
    {
        NSLog(@"Points in table TYellow_trail");
        NSLog(@"array: %@", points.latitude);
        NSLog(@"array: %@", points.longitude);
    }
    */
    
    [GMSServices provideAPIKey:@"AIzaSyCLsy1M5Nd6uSgQKIhZk9S1nASosjZPi2o"];
    
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    WCMSplashViewController *SVC = [[WCMSplashViewController alloc] initWithNibName:@"WCMSplashViewController" bundle:nil];
    
    //self.window.rootViewController = SVC;
    
    WCMViewController *MVC = [[WCMViewController alloc] initWithNibName:@"WCMViewController" bundle:nil];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[SVC, MVC];
    
    self.window.rootViewController = tabBarController;
    
    //self.window.rootViewController = MVC;
    [self.window makeKeyAndVisible];

    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

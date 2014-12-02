//
//  WCMViewController.h
//  MapDrawTest
//
//  Created by Michael McNally on 10/6/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Graph.cpp"
#import <GoogleMaps/GoogleMaps.h>
#import "WCMGPSPoints.h"

@interface WCMViewController : UIViewController

- (WCMGPSPoints*)getClosestPath;
- (GMSMutablePath*)findPath:(double) distance;
NSString* longestCommonPrefix(NSString* currPath, NSArray* visited);



@end



//
//  WCMGPSPoints.m
//  MapDrawTest
//
//  Created by Jeremy Garrell on 10/30/14.
//  Copyright (c) 2014 Jeremy Garrell. All rights reserved.
//

#import "WCMGPSPoints.h"

@implementation WCMGPSPoints

@synthesize latitude = _latitude;
@synthesize longitude = _longitude;

- (id)initWithLatLong:(NSMutableArray *)latitude longitude:(NSMutableArray *)longitude
{
    if ((self = [super init])){
        self.latitude = latitude;
        self.longitude = longitude;
    }
    return self;
}

@end

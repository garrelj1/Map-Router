//
//  WCMGPSPoints.h
//  MapDrawTest
//
//  Created by Jeremy Garrell on 10/30/14.
//  Copyright (c) 2014 Jeremy Garrell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCMGPSPoints : NSObject
{
    NSMutableArray *latitude;
    NSMutableArray *longitude;
}

@property (nonatomic, copy) NSMutableArray *latitude;
@property (nonatomic, copy) NSMutableArray *longitude;

- (id)initWithLatLong:(NSMutableArray *)latitude longitude:(NSMutableArray *)longitude;

@end

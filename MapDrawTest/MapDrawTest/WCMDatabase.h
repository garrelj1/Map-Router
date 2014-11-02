//
//  WCMDatabase.h
//  MapDrawTest
//
//  Created by Jeremy Garrell on 10/27/14.
//  Copyright (c) 2014 Jeremy Garrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface WCMDatabase : NSObject
{
    sqlite3 *_database;
}

+ (WCMDatabase*)database;
- (NSArray *)GPSPoints;

@end

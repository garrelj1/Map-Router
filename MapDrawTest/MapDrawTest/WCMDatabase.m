//
//  WCMDatabase.m
//  MapDrawTest
//
//  Created by Jeremy Garrell on 10/27/14.
//  Copyright (c) 2014 Jeremy Garrell. All rights reserved.
//

#import "WCMDatabase.h"

@implementation WCMDatabase

static WCMDatabase *_database;

+ (WCMDatabase*)database {
    if (_database == nil) {
        _database = [[WCMDatabase alloc] init];
    }
    return _database;
}


- (id)init {
    if ((self = [super init])) {
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"banklist"
                                                             ofType:@"sqlite3"];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (NSArray *)GPSPoints {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT latitude, longitude FROM TGPS_Points";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            double latitude = sqlite3_column_double(statement, 0);
            double longitude = sqlite3_column_double(statement, 1);
        }
        sqlite3_finalize(statement);
    }
    
    
    return result;
}

@end

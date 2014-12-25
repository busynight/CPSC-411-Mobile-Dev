//
//  IEGTDSQLite.m
//  IETrains
//
//  Created by Ivan Espinosa on 11/23/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEGTDSQLite.h"
static IEGTDSQLite* _singleton;

@implementation IEGTDSQLite

+(instancetype) sharedGTDF{
    
    if(_singleton != nil)
    {
        _singleton = [[IEGTDSQLite alloc] init];
        
    }
    return _singleton;
}

-(NSMutableArray*) allRoutesList{
    
    NSString *querySQL = @"select count(*) from routes;";
    const char *query_stmt = [querySQL UTF8String];
    sqlite3_stmt *stmt;
    int numberRoutes = 0;
    
    // Get the length for the routes
    
    if (sqlite3_prepare_v2(_dbConnection, query_stmt, -1, &stmt, NULL) == SQLITE_OK){
        
        if (sqlite3_step(stmt) == SQLITE_ROW){
            
            NSString *length_str = [[NSString alloc] initWithUTF8String:
                                    (const char *) sqlite3_column_text(stmt, 0)];
            numberRoutes = [length_str intValue];
        }
        else{
            return nil;
        }
        
        sqlite3_reset(stmt);
    }
    else{
        
        NSLog(@"Failed to prepare length");
    }
    
    querySQL = @"select distinct * from routes ORDER BY route_long_name;";
    query_stmt = [querySQL UTF8String];
    
    NSMutableArray* routeInfo = [[NSMutableArray alloc] init];
    NSMutableArray* routesList = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(_dbConnection, query_stmt, -1, &stmt, NULL) == SQLITE_OK){

        while (sqlite3_step(stmt) == SQLITE_ROW){
            
            for(int i = 0; i < 8; ++i ){
                
                NSString* route_column = [[NSString alloc] initWithUTF8String:
                                          (const char *) sqlite3_column_text(stmt, i)];
 

                
                [routeInfo addObject:route_column];
            }
            [routesList addObject:[[NSMutableArray alloc] initWithArray:routeInfo]];
            [routeInfo removeAllObjects];
        }
        
        sqlite3_reset(stmt);
    }
    else{
        
        NSLog(@"Failed to prepare routes");
    }
    NSLog(@"Returning routeList");
    return routesList;
}

@end

//
//  IEOCTAGTDF.m
//  IETrains
//
//  Created by Ivan Espinosa on 11/23/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEOCTAGTDF.h"

static IEOCTAGTDF* _octaLinkGTDF;
@implementation IEOCTAGTDF

@synthesize selected_route_id;
@synthesize selected_stop_name;

+(instancetype) sharedOCTA{
    
    if(_octaLinkGTDF == nil){
        
        _octaLinkGTDF = [[IEOCTAGTDF alloc] init];
        
    }
    return _octaLinkGTDF;
}

-(instancetype) init{
    
    NSString* dbpath = [[NSBundle mainBundle] pathForResource:@"OCTA" ofType:@"sl3"];
    
    if( self = [self initWithFile:dbpath]){
        
    }
    else
    {
        
        NSLog(@"Failed to init Octa");

    }
    
    
    return self;
}

-(NSMutableArray*) getStopNamesFromRoute:(NSString*) route_id{
    
    selected_route_id = route_id;
    
    NSString* querySQL = [[NSString alloc] initWithFormat:@"select distinct stop_name from routes r, trips t, stop_times st, stops s where r.route_id = t.route_id and r.route_id = \"%@\" and t.trip_id = st.trip_id and st.stop_id = s.stop_id ORDER BY stop_name;", route_id];
    
    sqlite3_stmt *stmt;
    const char* query_stmt = [querySQL UTF8String];
    
    NSMutableArray* stopsName = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(_dbConnection, query_stmt, -1, &stmt, NULL) == SQLITE_OK){
        
        while (sqlite3_step(stmt) == SQLITE_ROW){
            
            NSString* stop_name = [[NSString alloc] initWithUTF8String:
                                   (const char *) sqlite3_column_text(stmt, 0)];
            
            [stopsName addObject:stop_name];
        }
        
        sqlite3_reset(stmt);
    }
    
    return stopsName;
    
}

-(NSMutableArray*) getStopInformation:(NSString*) stop_name{
    
    //11
    selected_stop_name = stop_name;
    
    NSString* querySQL = [[NSString alloc] initWithFormat:@"select * from stops where stop_name = \"%@\";", stop_name];
    
    sqlite3_stmt *stmt;
    const char* query_stmt = [querySQL UTF8String];
    
    NSMutableArray* stopInfo = [[NSMutableArray alloc] init];
    
    if (sqlite3_prepare_v2(_dbConnection, query_stmt, -1, &stmt, NULL) == SQLITE_OK){
        
        if(sqlite3_step(stmt) == SQLITE_ROW){
            
            for(int i = 0; i < 11; ++i){
                NSString* stopContent = [[NSString alloc] initWithUTF8String:
                                         (const char *) sqlite3_column_text(stmt, i)];
                
                [stopInfo addObject:stopContent];
            }
            
        }
        
        sqlite3_reset(stmt);
    }
    
    return stopInfo;
    
}


@end

//
//  IEGTDSQLite.h
//  IETrains
//
//  Created by Ivan Espinosa on 11/23/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IESQLiteDB.h"

@interface IEGTDSQLite : IESQLiteDB
@property (nonatomic, retain) NSString* selected_route_id;
@property (nonatomic, retain) NSString* selected_stop_name;

+(instancetype) sharedGTDF;

-(NSMutableArray*) allRoutesList;

@end

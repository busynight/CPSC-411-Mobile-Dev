//
//  IEMetroLinkGTDF.h
//  IETrains
//
//  Created by Ivan Espinosa on 11/23/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEGTDSQLite.h"

@interface IEMetroLinkGTDF : IEGTDSQLite

+(instancetype) sharedMetro;


-(NSMutableArray*) getStopNamesFromRoute:(NSString*) route_id;

-(NSMutableArray*) getStopInformation:(NSString*) stop_name;

@end

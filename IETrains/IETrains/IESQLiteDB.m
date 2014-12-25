//
//  IESQLiteDB.m
//  IETrains
//
//  Created by Ivan Espinosa on 11/23/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IESQLiteDB.h"

@implementation IESQLiteDB


-(instancetype)initWithFile:(NSString *)aFileName{
    
    self = [super init];
    
    if(self){
        
        if(sqlite3_open([aFileName UTF8String], &_dbConnection) == SQLITE_OK){

            NSLog(@"Successfully opened: %@", aFileName);

        }
        else{
            
            NSLog(@"Failed to open: %@", aFileName);

        }
    }
    
    return self;
}

-(void)dealloc{
    
    sqlite3_close(_dbConnection);
}

@end

//
//  IESQLiteDB.h
//  IETrains
//
//  Created by Ivan Espinosa on 11/23/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

@interface IESQLiteDB : NSObject
{
    sqlite3 *_dbConnection;
}

-(instancetype) initWithFile:(NSString*) aFileName;
@end

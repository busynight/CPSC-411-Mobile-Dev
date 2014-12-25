//
//  IEFraction_Model.h
//  IEFraction_Calculator
//
//  Created by busynight on 10/27/14.
//  Copyright (c) 2014 busynight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArithmeticProtocol.h"

@interface IEFraction_Model : NSObject <ArithmeticProtocol>


@property(assign) int numerator;
@property(assign) int denominator;

-(IEFraction_Model*) initWithNumerator:(int) aNumerator withDenominator:(int) aDenominator;

-(IEFraction_Model*) initWithIEFraction:(IEFraction_Model*) aFraction;
-(void) simplify;

-(NSString*) simplyfiedResult;

+(int) gcdA: (int) a B:(int) b;
+(int) lcmA: (int) a B:(int) b;

@end

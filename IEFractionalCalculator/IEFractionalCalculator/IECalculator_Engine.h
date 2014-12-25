//
//  IECalculator_Engine.h
//  IEFraction_Calculator
//
//  Created by busynight on 10/27/14.
//  Copyright (c) 2014 busynight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IEFraction_Model.h"
#import "ArithmeticProtocol.h"

@interface IECalculator_Engine : NSObject

@property (retain, nonatomic) NSMutableArray* equation_list;


-(void) store:(id<ArithmeticProtocol, NSObject>) anOperand withOperator: (NSString*) anOperator;

+(IECalculator_Engine*) sharedCalculatorEngine;

-(NSMutableArray* ) postFixExpression;

-(id<ArithmeticProtocol, NSObject>) result;

-(int) operatorOrder:(NSString*)currentOperator;

-(SEL) getOperation:(NSString*)token;

-(void) reset;

@end

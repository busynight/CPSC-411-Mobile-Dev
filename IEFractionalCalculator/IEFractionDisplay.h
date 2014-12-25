//
//  IEFractionDisplay.h
//  IEFractionalCalculator
//
//  Created by Ivan Espinosa on 11/3/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IEFractionDisplay : NSObject

@property (retain, nonatomic) NSMutableArray* displayList;

+(IEFractionDisplay*) sharedEquationDisplay;


-(NSString*) printEquation;

-(void) updateCurrentOperand:(NSString*) operand;

-(void) addCurrentOperand: (NSString*) operand;

-(void) removeLastOperand;

-(void) clear;
@end


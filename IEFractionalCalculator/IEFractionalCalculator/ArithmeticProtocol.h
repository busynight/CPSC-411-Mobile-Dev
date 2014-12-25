//
//  Arithmetic.h
//  IEFraction_Calculator
//
//  Created by busynight on 10/27/14.
//  Copyright (c) 2014 busynight. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ArithmeticProtocol <NSObject>

-(id) add:(id) rhs;
-(id) subtract:(id) rhs;
-(id) divide:(id) rhs;
-(id) multiply:(id) rhs;

-(id) negate;
-(NSString* ) description;

@end

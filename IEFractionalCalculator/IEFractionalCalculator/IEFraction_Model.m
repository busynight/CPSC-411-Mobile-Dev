//
//  IEFraction_Model.m
//  IEFraction_Calculator
//
//  Created by busynight on 10/27/14.
//  Copyright (c) 2014 busynight. All rights reserved.
//


#import "IEFraction_Model.h"

@implementation IEFraction_Model : NSObject

@synthesize numerator;
@synthesize denominator;

-(IEFraction_Model *) initWithNumerator:(int)aNumerator withDenominator:(int)aDenominator{
    
    self = [super init];
    
    if(self){
        
        if ( (aNumerator < 0 && aDenominator < 0) ||  (aDenominator < 0 && aNumerator > 0) ){
            
            aNumerator *= -1;
            aDenominator *= -1;
        }
        
        
        self.numerator = aNumerator;
        self.denominator = aDenominator;
        [self simplify];
    }
    
    return self;
}
-(IEFraction_Model*) initWithIEFraction:(IEFraction_Model*) aFraction{
    
    self = [super init];
    
    if(self){
        
        self.numerator = aFraction.numerator;
        self.denominator =aFraction.denominator;
        
    }
    
    return self;
}

-(void) simplify {
    
    int a = [IEFraction_Model gcdA:numerator B:denominator];
    
    numerator /= a;
    denominator /= a;
    
}

+(int) gcdA: (int) a B:(int) b{
    
    a = abs(a);
    b = abs(b);
    
    int t = 0;
    
    while (b != 0 ){
        
        t = b;
        b = a % b;
        a = t;
        
    }
    return a;
    
}
+(int) lcmA: (int) a B:(int) b{
    
    a = abs(a);
    b = abs(b);
    
    return (a * b) / [IEFraction_Model gcdA:a B:b];
    
}


-(IEFraction_Model*) add: (IEFraction_Model*) rhs{
    
    int newDenom = [IEFraction_Model lcmA:denominator B:rhs.denominator];
    
    int mult1 = newDenom / denominator;
    int mult2 = newDenom / rhs.denominator;
    
    int newNum = numerator * mult1 + rhs.numerator * mult2;
    
    return [[IEFraction_Model alloc] initWithNumerator:newNum withDenominator:newDenom];
    
}
-(IEFraction_Model*) multiply: (IEFraction_Model*) rhs{
    
    int newNum = numerator  * rhs.numerator;
    int newDenom = denominator * rhs.denominator;
    
    return [[IEFraction_Model alloc] initWithNumerator:newNum withDenominator:newDenom];
    
}

-(IEFraction_Model*) subtract: (IEFraction_Model*) rhs{
    
    int newDenom = [IEFraction_Model lcmA:denominator B:rhs.denominator];
    
    int mult1 = newDenom / denominator;
    int mult2 = newDenom / rhs.denominator;
    
    int newNum = numerator * mult1 - rhs.numerator * mult2;
    
    return [[IEFraction_Model alloc] initWithNumerator:newNum withDenominator:newDenom];
}
-(IEFraction_Model*) divide: (IEFraction_Model*) rhs{

    int newNum = numerator  * rhs.denominator;
    int newDenom = denominator * rhs.numerator;
    
    return [[IEFraction_Model alloc] initWithNumerator:newNum withDenominator:newDenom];
}

-(IEFraction_Model*) negate{
    
    return [[IEFraction_Model alloc] initWithNumerator:(-numerator) withDenominator:denominator];
}
-(NSString*) simplyfiedResult{
    
    if (denominator == 1){
        
        return [NSString stringWithFormat:@"%i", self.numerator];
    }
    
    NSString* result = [[NSString alloc] init];
    
    if (numerator /  denominator > 0 ){
        
        result = [result stringByAppendingFormat:@"%i ", numerator / denominator];
        
    }
    
    result = [ result stringByAppendingFormat:@"%i/%i", numerator % denominator, denominator];
    
    return result;
    
}
-(NSString*)description{
    
    
    if (denominator == 1){
        
        return [NSString stringWithFormat:@"%i", self.numerator];
    }

    return [NSString stringWithFormat:@"%i/%i", self.numerator, self.denominator];
    
}

@end

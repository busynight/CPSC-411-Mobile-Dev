//
//  IEFractionDisplay.m
//  IEFractionalCalculator
//
//  Created by Ivan Espinosa on 11/3/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEFractionDisplay.h"

@implementation IEFractionDisplay

@synthesize displayList;

-(id) init{
    
    self = [super init];
    
    if(self){
        
        self.displayList = [[NSMutableArray alloc] init];
    }
    
    return self;
    
}

+(IEFractionDisplay*) sharedEquationDisplay{
    static IEFractionDisplay *sharedEquationDisplayer = nil;
    @synchronized(self) {
        if(sharedEquationDisplayer == nil){
            
            sharedEquationDisplayer = [[IEFractionDisplay alloc] init];
        }
    }
    
    return sharedEquationDisplayer;
}

-(NSString*) printEquation{
    
    NSString* print = [[NSString alloc] init];
    
    print = @"";
    
    for (id object in displayList){
        
        print  = [print stringByAppendingString:object];
    }
    
    return print;
}

-(void) updateCurrentOperand:(NSString*) operand{
    
    if( [displayList count] != 0)
        [displayList removeLastObject];
    
    [displayList addObject:operand];
}

-(void) addCurrentOperand: (NSString*) operand{
    
    [displayList addObject:operand];
    [displayList addObject:@""];
    
}

-(void) removeLastOperand{

    if( [displayList count] != 0)
        [displayList removeLastObject];
}

-(void) clear{
    
    if( [displayList count] != 0)
        [displayList removeAllObjects];
}
@end

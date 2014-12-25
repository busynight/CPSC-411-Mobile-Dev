//
//  IECalculator_Engine.m
//  IEFraction_Calculator
//
//  Created by busynight on 10/27/14.
//  Copyright (c) 2014 busynight. All rights reserved.
//

#import "IECalculator_Engine.h"


@implementation IECalculator_Engine


@synthesize equation_list;

-(id) init{
    
    self = [super init];
    
    if(self) {
        
        self.equation_list = [[NSMutableArray alloc] init];
        
    }
    return self;
}

+(IECalculator_Engine*) sharedCalculatorEngine{
    static IECalculator_Engine *sharedCalculatorEnginer = nil;
    @synchronized(self) {
        if(sharedCalculatorEnginer == nil){
    
            sharedCalculatorEnginer = [[IECalculator_Engine alloc] init];
        }
    }
    
    return sharedCalculatorEnginer;
}



-(void) store:(id<ArithmeticProtocol, NSObject>) anOperand withOperator: (NSString*) anOperator
{
    [equation_list addObject:anOperand];
    [equation_list addObject:anOperator];
    
}

-(int) operatorOrder:(NSString*)currentOperator{
    
    if ([currentOperator isEqualToString:@"*"] || [currentOperator isEqualToString:@"/"] ){
        
        return 2;
    }
    if ([currentOperator isEqualToString:@"+"] || [currentOperator isEqualToString:@"-"] ){
        
        return 1;
    }
    //
    return 0;
    
}

-(NSMutableArray* ) postFixExpression{
    
    NSMutableArray* output = [[NSMutableArray alloc] init];
    NSMutableArray* operatorStack = [[NSMutableArray alloc] init];
    
    for (NSObject* object in equation_list){
        
        if ([object isKindOfClass:[NSString class] ]){
            
            if([object isEqual:@"="]){
                break;
            }
            
            if( [operatorStack count] == 0){
                
                [operatorStack addObject:object];
            }
            else{


                NSString* lastObject =[operatorStack lastObject];

                if ([self operatorOrder:(NSString *)object] <= [self operatorOrder:lastObject]) {
                    
                    
                    [output addObject:lastObject];
                    [operatorStack removeLastObject];
                }
                
                //add to operator stack
                [operatorStack addObject:object];
            }
            
        }
        else{
            
            [output addObject:object];
        }
        
    }
    
    while ([operatorStack count] != 0 ){
        
        [output addObject:[operatorStack lastObject]];
        
        [operatorStack removeLastObject];
    }
    

    
    return [[NSMutableArray alloc] initWithArray:output];
}

-(id<ArithmeticProtocol, NSObject>) result{
    

    
    NSMutableArray* stack = [[NSMutableArray alloc] init];
    
    NSMutableArray* posfixStack = [[NSMutableArray alloc] initWithArray:[self postFixExpression]];
    
    for(id object in posfixStack){
        
        if([object isKindOfClass:[NSString class]]){
            
            if( [stack count] > 1){
                
                //Get right operand then pop
                id rightOperand = [ stack lastObject];
                [stack removeLastObject];
                
                //Get left operand then pop
                id leftOperand = [ stack lastObject];
                [stack removeLastObject];
                
                SEL operation = [self getOperation:object];
                
                if ([leftOperand respondsToSelector:operation]){
                
                    id result = [leftOperand performSelector:operation withObject:rightOperand];
                    
                    [stack addObject:result];

                }
                
            }
            else{
                return NULL;
            }
            
        }
        else{
            
            [stack addObject:object];
        }
        
    }
    return [stack lastObject];
}

-(void) reset{
    
    [equation_list removeAllObjects];
}

-(SEL) getOperation:(NSString*)token{
    
    if( [token isEqualToString:@"+" ]){
        
        return @selector(add:);
    }
    else if( [token isEqualToString:@"-" ]){
        
        return @selector(subtract:);
    }
    else if( [token isEqualToString:@"*" ]){
        
        return @selector(multiply:);
    }
    else if( [token isEqualToString:@"/" ]){
        
        return @selector(divide:);
    }

    
    return NULL;
}


@end

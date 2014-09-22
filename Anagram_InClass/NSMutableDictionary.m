//
//  NSMutableDictionary.m
//  Anagram_InClass
//
//  Created by Ivan Espinosa on 9/9/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "NSMutableDictionary.h"

@implementation NSMutableDictionary (CodeCategory)

-(void) PrintLongestAnagram{
    
    NSString* long_key;
    NSUInteger longest_length = 0;
    for(NSString *key in self) {
        NSMutableArray *value = [self objectForKey:key];
        
        if(longest_length < [value count]){
            
            longest_length = [value count];
            long_key = key;
        }
    }
    
    NSLog(@"%@", self[long_key]);
}

@end

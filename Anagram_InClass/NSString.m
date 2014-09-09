//
//  NSString.m
//  Anagram_InClass
//
//  Created by Ivan Espinosa on 9/8/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "NSString.h"

@implementation NSString (CodeCategory)

-(NSString*) code{
    
    NSUInteger length = [self length];
    unichar* chars = (unichar*) calloc(sizeof(unichar), length);
    [self getCharacters:chars range:NSMakeRange(0, length)];
    
    qsort_b(chars, length, sizeof(unichar),
            
            ^(const void*l, const void* r){
                unichar left = *(unichar*) l;
                unichar right = *(unichar*) r;
                return (int)(left -right);} );
    
    NSString * code  = [NSString stringWithCharacters:chars length:length];
    
    return code;
}
/*
int char_cmp(const void* a, const void* b){
    
    return *(unichar* )a - *(unichar* )b;
}
*/
@end

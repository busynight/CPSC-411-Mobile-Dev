//
//  Word.m
//  Anagram_InClass
//
//  Created by Ivan Espinosa on 9/8/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "Word.h"
#import "NSString.h"

@implementation Word

@synthesize code;
@synthesize word;

-(instancetype) initWithWord:(NSString *)aWord{
    
    self = [super init];
    
    if(self){
        
        word = aWord;
        
        NSString *lowerCaseWord = [aWord lowercaseString];
        code = [lowerCaseWord code];
    }
    return self;
}

-(NSComparisonResult) compare:(Word*) otherWord{
    
    return [self.code compare:otherWord.code];
    
}

-(NSString*)description{
    
    return [NSString stringWithFormat:@"Word: %@", word];
}

@end

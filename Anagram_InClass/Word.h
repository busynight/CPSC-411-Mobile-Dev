//
//  Word.h
//  Anagram_InClass
//
//  Created by Ivan Espinosa on 9/8/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

//Description method

@property (retain, nonatomic) NSString* word;
@property (retain, nonatomic) NSString* code;


-(instancetype) initWithWord:(NSString*) aWord;
-(NSComparisonResult) compare:(Word*) otherWord;

@end

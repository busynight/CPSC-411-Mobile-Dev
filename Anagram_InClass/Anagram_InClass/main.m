//
//  main.m
//  Anagram_InClass
//
//  Created by Ivan Espinosa on 9/8/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"
#import "Timer.h"
#import "NSMutableDictionary.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Timer *timer = [[Timer alloc] init];
        
        [timer startTimer];
        
        //Need to find a way of getting the file from a relative path
        NSString* fileName = @"/cs411f14/iespinosa/asgt2/Anagram_InClass/words";
        
        NSError *error;
        NSString *fileContents = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:&error];
        
        if (error)
            NSLog(@"Error reading file: %@", error.localizedDescription);
        
        
        NSArray *listArray = [fileContents componentsSeparatedByString:@"\n"];
        
        NSMutableDictionary *anagramLists = [[NSMutableDictionary alloc] init];
        
        for (NSString *temp in listArray) {
            Word *newWord = [[Word alloc] initWithWord:temp];
            
            if([anagramLists objectForKey:[newWord code]] != nil){
                
                [anagramLists[[newWord code]] addObject:newWord ];
                
            }
            else{
                
                NSMutableArray *newList = [[NSMutableArray alloc] init];
                [newList addObject:newWord];
                anagramLists[[newWord code]] = newList;
                
            }
        }
        [timer stopTimer];
        [anagramLists PrintLongestAnagram];
        NSLog(@"Total time was: %lf milliseconds", [timer timeElapsedInMilliseconds]);
        NSLog(@"Total time was: %lf seconds", [timer timeElapsedInSeconds]);
        NSLog(@"Total time was: %lf minutes", [timer timeElapsedInMinutes]);
        
    }
    
    
    return 0;
}


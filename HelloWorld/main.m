//
//  main.m
//  HelloWorld
//
//  Created by Ivan Espinosa on 8/28/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Type a text");
        NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
        
        NSData *inputData = [input availableData];
        
        NSString *str = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
        
        // insert code here...
        NSLog(@"You Typed: %@", str);
        
        
    }
    return 0;
}


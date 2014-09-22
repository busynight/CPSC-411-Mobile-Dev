//
//  IESubject.h
//  BMI_Calculator
//
//  Created by Ivan Espinosa on 9/17/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IESubject : NSObject

@property (retain, nonatomic) NSNumber* heightInMeters;
@property (retain, nonatomic) NSNumber* weightInKilograms;

@property (readonly, nonatomic) NSNumber* bmi;
@property (readonly, nonatomic) NSString* category;
+(instancetype)only_subject;


-(NSString*)description;

@end

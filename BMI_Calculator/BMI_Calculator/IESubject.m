//
//  IESubject.m
//  BMI_Calculator
//
//  Created by Ivan Espinosa on 9/17/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IESubject.h"

static IESubject* private_subject;

@implementation IESubject

@synthesize heightInMeters;
@synthesize weightInKilograms;

-(NSNumber*) bmi{
    
    return @(weightInKilograms.floatValue / (heightInMeters.floatValue * heightInMeters.floatValue));
    
}

-(NSString* )category{
    
    float bmi_test = self.bmi.floatValue;
    
    if(bmi_test < 16.00)
        
        return @"Severe Thiness";
    
    else if (bmi_test < 17.00)
    
        return @"Moderate Thiness";
    
    else if (bmi_test < 18.50)
        
        return @"Mild Thiness";
    
    else if (bmi_test < 25.00)
        
        return @"Normal Range";
    
    else if (bmi_test < 30.00)
        
        return @"Overweight";
    
    else if (bmi_test < 35.00)
        
        return @"Obese Class I\r(Moderate)";
    
    else if (bmi_test < 40.00)
        
        return @"Obese Class II\r(Severe)";
    
    else
        
        return @"Obese Class III\r(Very Severe)";
    
    
    
}

-(NSString *)description{
    
    return [NSString stringWithFormat:@"%@\r%@", self.bmi, self.category];
}

+(instancetype)only_subject{
    
    if(private_subject == nil){
        
        private_subject = [[IESubject alloc] init];
    }
    
    return private_subject;
}


@end

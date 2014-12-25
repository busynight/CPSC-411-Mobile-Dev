//
//  IEModel.m
//  Discount_Calculator
//
//  Created by Ivan Espinosa on 10/4/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEModel.h"

const float length = 400.0;
const float topOfBox = 50.0;

static IEModel* private_model;


@implementation IEModel

@synthesize originalPrice;
@synthesize dollarsOffValue;
@synthesize discountPercent;
@synthesize addlDiscountPercentage;
@synthesize taxPercent;


// Stores the information entered into the textfields
- (void) setOriginalPrice:(NSDecimalNumber *) original
       setDollarsOff: (NSDecimalNumber*) dollarsOff
     setDiscountPerc: (NSDecimalNumber*) discountPerc
     setAddlDiscount:(NSDecimalNumber*) addlDiscPerc
              setTax: (NSDecimalNumber*) taxPerc{
    self.originalPrice = original;
    self.dollarsOffValue = dollarsOff;
    self.discountPercent = discountPerc;
    self.addlDiscountPercentage = addlDiscPerc;
    self.taxPercent = taxPerc;
}

- (NSDecimalNumber*) taxValue{
    
    return [[NSDecimalNumber alloc] initWithFloat:(self.originalPrice.floatValue * (self.taxPercent.floatValue / 100.0f))];
    
}

- (NSDecimalNumber*) totalPrice{
    
    float result = self.originalPrice.floatValue + self.taxValue.floatValue;
    
    return [[NSDecimalNumber alloc] initWithFloat:result];
}

- (NSDecimalNumber*) discountTotalValue{
    
    float result = self.totalPrice.floatValue - self.discountValue.floatValue - self.dollarsOffValue.floatValue - self.addlDiscValue.floatValue;
    
    return [[NSDecimalNumber alloc] initWithFloat:result];

}

- (NSDecimalNumber*) discountValue{
    
    
    return [[NSDecimalNumber alloc] initWithFloat:(self.originalPrice.floatValue * (self.discountPercent.floatValue / 100.0f))];
    
}
- (NSDecimalNumber*) addlDiscValue{
    
    float priceAfterDiscount = (self.originalPrice.floatValue * (self.discountPercent.floatValue / 100.0f));
    
    return [[NSDecimalNumber alloc] initWithFloat:(priceAfterDiscount * (self.addlDiscountPercentage.floatValue / 100.0f))] ;
    
}
- (NSDecimalNumber*) discountTotalPercent{
    
    float result = self.discountTotalValue.floatValue / self.totalPrice.floatValue;
    
    return [[NSDecimalNumber alloc] initWithFloat:result];
}

- (NSDecimalNumber*) dollarsOffPercentage{
    
    float num = self.totalPrice.floatValue - self.dollarsOffValue.floatValue;
    
    float result = num / self.totalPrice.floatValue;
    
    return [[NSDecimalNumber alloc] initWithFloat:result];
}


- (NSDecimalNumber*) discTotalSize{
    
    return [[NSDecimalNumber alloc] initWithFloat:(length * self.discountTotalPercent.floatValue /100.0f)];
}
- (NSDecimalNumber*) dollarsOffYCoordinate{
    
    return [[NSDecimalNumber alloc] initWithFloat:(self.discountSize.floatValue + self.addlDiscSize.floatValue + topOfBox)];
}
- (NSDecimalNumber*) dollarsOffSize{
    
    return [[NSDecimalNumber alloc] initWithFloat:(self.dollarsOffPercentage.floatValue / 100.0f * length)];
}
- (NSDecimalNumber*) discountYCoordinate{
    
    return [[NSDecimalNumber alloc] initWithFloat:(self.addlDiscSize.floatValue + topOfBox)];
}
- (NSDecimalNumber*) discountSize{
    
    return [[NSDecimalNumber alloc] initWithFloat:(length * self.discountPercent.floatValue / 100.0f)];
    
}
- (NSDecimalNumber*) addlDiscYCoordinate{
    
    return [[NSDecimalNumber alloc] initWithFloat:topOfBox];
}

- (NSDecimalNumber*) addlDiscSize{
    return [[NSDecimalNumber alloc] initWithFloat:(length *self.addlDiscountPercentage.floatValue / 100.0f)];
}

+(instancetype)only_subject{
    
    if(private_model == nil){
        
        private_model = [[IEModel alloc] init];
    }
    
    return private_model;
}

@end

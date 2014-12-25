//
//  IEModel.h
//  Discount_Calculator
//
//  Created by Ivan Espinosa on 10/4/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IEModel : NSObject

//Information to recieve/ use on the label
@property (retain, nonatomic) NSDecimalNumber* originalPrice;
@property (retain, nonatomic) NSDecimalNumber* dollarsOffValue;
@property (retain, nonatomic) NSDecimalNumber* taxPercent;
@property (retain, nonatomic) NSDecimalNumber* discountPercent;
@property (retain, nonatomic) NSDecimalNumber* addlDiscountPercentage;


@property (readonly, nonatomic) NSDecimalNumber* totalPrice;
@property (readonly, nonatomic) NSDecimalNumber* discountValue;
@property (readonly, nonatomic) NSDecimalNumber* addlDiscValue;
@property (readonly, nonatomic) NSDecimalNumber* discountTotalPercent;
@property (readonly, nonatomic) NSDecimalNumber* discountTotalValue;
@property (readonly, nonatomic) NSDecimalNumber* dollarsOffPercentage;
@property (readonly, nonatomic) NSDecimalNumber* taxValue;

@property (readonly, nonatomic) NSDecimalNumber* discTotalSize;

@property (readonly, nonatomic) NSDecimalNumber* dollarsOffYCoordinate;
@property (readonly, nonatomic) NSDecimalNumber* dollarsOffSize;
@property (readonly, nonatomic) NSDecimalNumber* discountYCoordinate;
@property (readonly, nonatomic) NSDecimalNumber* discountSize;
@property (readonly, nonatomic) NSDecimalNumber* addlDiscYCoordinate;
@property (readonly, nonatomic) NSDecimalNumber* addlDiscSize;




- (void) setOriginalPrice:(NSDecimalNumber *)original
    setDollarsOff: (NSDecimalNumber*) dollarsOffValue
      setDiscountPerc: (NSDecimalNumber*) discountPercent
  setAddlDiscount:(NSDecimalNumber*) addlDiscPerc
              setTax: (NSDecimalNumber*) taxPerc;


+(instancetype)only_subject;

@end

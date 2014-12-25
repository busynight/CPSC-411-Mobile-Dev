//
//  IEQuartzView.h
//  Discount_Calculator
//
//  Created by Ivan Espinosa on 10/6/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IEQuartzView : UIView

@property unsigned int view;
@property float dollarsOffYCoordinate;
@property float dollarsOffSize;
@property float discountYCoordinate;
@property float discountSize;
@property float addlDiscYCoordinate;
@property float addlDiscSize;
@property float discTotalSize;
@property NSString *total;
@property NSString *dollarsOff;
@property NSString *discount;
@property NSString *addlDisc;
@property NSString *discountTotal;
@property NSString *dOffPercentage;
@property NSString *discPercentage;
@property NSString *addlDiscPercentage;
@property NSString *discTotalPercentage;
@end

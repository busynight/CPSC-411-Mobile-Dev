//
//  IEOtherViewController.m
//  Discount_Calculator
//
//  Created by Ivan Espinosa on 10/6/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEOtherViewController.h"

@interface IEOtherViewController ()

@end

@implementation IEOtherViewController


// Allocates and initializes memory for the model class


// Recognizes when the user swipes to the right, assigns values to OtherController's view protocols
- (void)viewDidLoad
{
    IEModel* otherModel = [IEModel only_subject];
    
    // Assigns values to be used for the Y Coordinates and rectangle length
    ((IEQuartzView*)self.view).dollarsOffYCoordinate = otherModel.dollarsOffYCoordinate.floatValue;
    ((IEQuartzView*)self.view).dollarsOffSize = otherModel.dollarsOffSize.floatValue;
    
    ((IEQuartzView*)self.view).discountYCoordinate = otherModel.discountYCoordinate.floatValue;
    ((IEQuartzView*)self.view).discountSize = otherModel.discountSize.floatValue;
    
    ((IEQuartzView*)self.view).addlDiscYCoordinate = otherModel.addlDiscYCoordinate.floatValue;
    ((IEQuartzView*)self.view).addlDiscSize = otherModel.addlDiscSize.floatValue;
    
    
    // Converts floats to NSStrings to be displayed in the view of OtherController
    ((IEQuartzView*)self.view).total = [NSString stringWithFormat:@"$%.2f", otherModel.totalPrice.floatValue];
    ((IEQuartzView*)self.view).dollarsOff = [NSString stringWithFormat:@"$%.2f", otherModel.dollarsOffValue.floatValue];
    ((IEQuartzView*)self.view).discount = [NSString stringWithFormat:@"$%.2f", (otherModel.discountPercent.floatValue/100)*otherModel.totalPrice.floatValue];
    ((IEQuartzView*)self.view).addlDisc = [NSString stringWithFormat:@"$%.2f", (otherModel.addlDiscountPercentage.floatValue/100)*otherModel.totalPrice.floatValue];
    ((IEQuartzView*)self.view).discountTotal = [NSString stringWithFormat:@"$%.2f", otherModel.discountTotalValue.floatValue];
    ((IEQuartzView*)self.view).dOffPercentage = [NSString stringWithFormat:@"%.1f%%", otherModel.dollarsOffPercentage.floatValue];
    ((IEQuartzView*)self.view).discPercentage = [NSString stringWithFormat:@"%.1f%%", otherModel.discountPercent.floatValue];
    ((IEQuartzView*)self.view).addlDiscPercentage = [NSString stringWithFormat:@"%.1f%%", otherModel.addlDiscountPercentage.floatValue];
    ((IEQuartzView*)self.view).discTotalPercentage = [NSString stringWithFormat:@"%.1f%%", otherModel.discountTotalPercent.floatValue*100];
    ((IEQuartzView*)self.view).discTotalSize = otherModel.discTotalSize.floatValue;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
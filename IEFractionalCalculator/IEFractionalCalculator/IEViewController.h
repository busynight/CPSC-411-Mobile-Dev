//
//  IEViewController.h
//  IEFractionalCalculator
//
//  Created by Ivan Espinosa on 11/2/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IEFraction_Model.h"

@interface IEViewController : UIViewController

@property (assign, nonatomic) int numerator;
@property (assign, nonatomic) int denomator;
@property (assign, nonatomic) bool fractionPressed;
@property (assign, nonatomic) bool numerFirstDigit;
@property (assign, nonatomic) bool denomFirstDigit;
@property (retain, nonatomic) IEFraction_Model* waitingOperand;


@property (weak, nonatomic) IBOutlet UILabel *displayText;

- (IBAction)ButtonPressed:(id)sender;


@end

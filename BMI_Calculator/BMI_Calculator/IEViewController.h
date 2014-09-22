//
//  IEViewController.h
//  BMI_Calculator
//
//  Created by Ivan Espinosa on 9/17/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IEViewController : UIViewController


- (IBAction)calculateButtonPress:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *calculateBtn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitChanger;
@property (weak, nonatomic) IBOutlet UITextField *lengthTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UILabel *bmiValue;
@property (weak, nonatomic) IBOutlet UILabel *length_lbl;
@property (weak, nonatomic) IBOutlet UILabel *weight_lbl;
- (IBAction)changingUnits:(id)sender;

@end

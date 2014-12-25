//
//  IEViewController.h
//  Discount_Calculator
//
//  Created by Ivan Espinosa on 9/22/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IEOtherViewController.h"
#import "IEModel.h"

@interface IEViewController : UIViewController
{
    NSMutableString* inputBuffer;
}
//Pop navigation controller
@property (weak, nonatomic) IBOutlet UITextField *price_txt;
@property (weak, nonatomic) IBOutlet UITextField *dollars_off_txt;
@property (weak, nonatomic) IBOutlet UITextField *discount_txt;
@property (weak, nonatomic) IBOutlet UITextField *addl_discount_txt;
@property (weak, nonatomic) IBOutlet UITextField *tax_txt;
@property (weak, nonatomic) IBOutlet UILabel *original_price_lbl;
@property (weak, nonatomic) IBOutlet UILabel *discount_lbl;
- (IBAction)calculatePressed:(id)sender;

@end

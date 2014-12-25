//
//  IEViewController.m
//  Discount_Calculator
//
//  Created by Ivan Espinosa on 9/22/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEViewController.h"

const int SIZE = 5;

@interface IEViewController ()

@end

@implementation IEViewController

// Recognizes when the user swipes to the left, also keeps the same values entered in the first view
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.price_txt.delegate = self;
    self.dollars_off_txt.delegate =  self;
    self.discount_txt.delegate = self;
    self.addl_discount_txt.delegate = self;
    self.tax_txt.delegate = self;
    
    self.price_txt.tag = 1;
    self.dollars_off_txt.tag =  2;
    self.discount_txt.tag = 3;
    self.addl_discount_txt.tag = 4;
    self.tax_txt.tag = 5;
    
    // Internal buffer empty
    inputBuffer = [NSMutableString stringWithString:@""];
    
    //Get Singleton of the subject
    IEModel* model = [IEModel only_subject];
    
    self.price_txt.text = [NSString stringWithFormat:@"%.2f", model.originalPrice.floatValue];
    self.dollars_off_txt.text = [NSString stringWithFormat:@"%.2f", model.dollarsOffValue.floatValue];
    self.discount_txt.text = [NSString stringWithFormat:@"%.0f", model.discountValue.floatValue];
    self.addl_discount_txt.text = [NSString stringWithFormat:@"%.0f", model.addlDiscValue.floatValue];
    self.tax_txt.text = [NSString stringWithFormat:@"%.0f", model.taxValue.floatValue];
    self.original_price_lbl.text = [NSString stringWithFormat:@"Original Price: $%.2f", model.totalPrice.floatValue];
    self.discount_lbl.text = [NSString stringWithFormat:@"Discount Price: $%.2f", model.discountTotalValue.floatValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (BOOL) textFieldShouldBeginEditing: (UITextField*) textField{
    
    
    NSInteger tag = textField.tag;
    NSInteger nextTag = (tag + 1) % (SIZE+1);

    NSInteger absTag = ( (tag - 1) < 0 ) ? (1 - tag) : (tag - 1);
    
    NSInteger prevTag =  absTag % (SIZE+1);
    
    UIToolbar* toolbar = [[UIToolbar alloc] init];

    [toolbar sizeToFit];
    
    UIBarButtonItem* prevButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Previous"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(prevPressed:)];
    
    prevButton.tag    = prevTag;
    
    UIBarButtonItem* nextButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Next"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(nextPressed:)];
    
    nextButton.tag    = nextTag;
    
    UIBarButtonItem* flexButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                   target: self
                                   action: nil];
    
    UIBarButtonItem* doneButton =[[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                  target: self
                                  action: @selector(donePressed:)];
    doneButton.tag = tag;
    
    NSArray* buttons = @[prevButton, nextButton, flexButton, doneButton];
    [toolbar setItems:buttons];
    [textField setInputAccessoryView: toolbar];
    
    return YES;

}

- (void)nextPressed: (UIBarButtonItem*) sender
{
    NSInteger tag = sender.tag;
    
    [[self.view viewWithTag:tag] becomeFirstResponder]; // set focus
}

- (void)prevPressed: (UIBarButtonItem*) sender
{
    NSInteger tag = sender.tag;
    
    [[self.view viewWithTag:tag] becomeFirstResponder]; // set focus
}

- (void) donePressed: (UIBarButtonItem*) sender
{
    NSInteger tag = sender.tag;
    [[self.view viewWithTag:tag] resignFirstResponder]; // resign focus
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    const char * _char = [string cStringUsingEncoding:NSUTF8StringEncoding];
    int isBackSpace = strcmp(_char, "\b");
    
    if (isBackSpace == -8) {
        // is backspace
        if (inputBuffer.length > 0) {
            inputBuffer = [NSMutableString stringWithString: [inputBuffer substringToIndex:inputBuffer.length - 1]];
        }
    }
    
    if(textField.tag == 1)
    {
        [inputBuffer appendString: string];
        // Make sure valid amount in buffer
        if(inputBuffer.length > 0)
        {
            NSDecimalNumber* num = [[NSDecimalNumber decimalNumberWithString: inputBuffer] decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"100.00"]];

            textField.text = [NSString stringWithFormat:@"%.2f", num.floatValue];
        }
    }
    
    else if(textField.tag == 2)
    {
        [inputBuffer appendString: string];
        NSDecimalNumber* num = [NSDecimalNumber decimalNumberWithString:inputBuffer];
        textField.text = [NSString stringWithFormat:@"%.2f", num.floatValue];
    }
    
    else if(textField.tag < 6 && textField.tag > 2)
    {
        [inputBuffer appendString: string];
        textField.text = [NSString stringWithFormat:@"%@ %%", inputBuffer];
    }
    
    if(inputBuffer.length == 0)
    {
        textField.text = @"";
    }
    
    return NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // Clear internal buffer
    inputBuffer = [NSMutableString stringWithString:@""];
}

// Hides the keyboard when the user clicks outside the keyboard
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.price_txt resignFirstResponder];
    [self.dollars_off_txt resignFirstResponder];
    [self.discount_txt resignFirstResponder];
    [self.addl_discount_txt resignFirstResponder];
    [self.tax_txt resignFirstResponder];
}

// Calculates the original price (price + tax) and discount price


- (IBAction)calculatePressed:(id)sender {
    IEModel* model = [IEModel only_subject];
    
    NSDecimalNumber* originalPrice = [NSDecimalNumber decimalNumberWithString:self.price_txt.text];
    NSDecimalNumber* taxPercent = [NSDecimalNumber decimalNumberWithString: self.tax_txt.text];
    
    
    NSDecimalNumber* dollarsOffPrice = [NSDecimalNumber decimalNumberWithString:self.dollars_off_txt.text];
    
    NSDecimalNumber* discountPrice = [NSDecimalNumber decimalNumberWithString: self.discount_txt.text];
    
    
    
    NSDecimalNumber* addlDiscPrice = [NSDecimalNumber decimalNumberWithString:self.addl_discount_txt.text] ;
    
    
    [model setOriginalPrice:originalPrice setDollarsOff:dollarsOffPrice setDiscountPerc:discountPrice setAddlDiscount:addlDiscPrice setTax:taxPercent];
    
    self.original_price_lbl.text = [NSString stringWithFormat: @"Original Price: $%.2f", model.totalPrice.floatValue];
    self.discount_lbl.text = [NSString stringWithFormat:@"Discount Price: $%.2f", model.discountTotalValue.floatValue];

}


@end

//
//  IEViewController.m
//  BMI_Calculator
//
//  Created by Ivan Espinosa on 9/17/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#define LBS_TO_KG 0.453592f
#define IN_TO_M 0.0254f
#define CM_TO_M 0.01f

#import "IEViewController.h"
#import "IESubject.h"

@interface IEViewController ()

@end

@implementation IEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateButtonPress:(id)sender {
    
    //Get Singleton of the subject
    IESubject* subject = [IESubject only_subject];
    
    //Create formatter to change the format of the text field NSString values
    NSNumberFormatter *str_to_num = [[NSNumberFormatter alloc] init];
    
    [str_to_num setNumberStyle:NSNumberFormatterNoStyle];

    //Convert text from the height text field
    [subject setHeightInMeters:[str_to_num numberFromString:[_lengthTextField text]]];

    //If the input for height is invalid
    if ( str_to_num == nil ){
        
        [_bmiValue setText:@"Incorrect Height Input"];
        return;
    }

    
    [subject setWeightInKilograms:[str_to_num numberFromString:[_weightTextField text]]];

    //If the input for weight is invalid
    if ( str_to_num == nil ){
        
        [_bmiValue setText:@"Incorrect Weight Input"];
        
        return;
    }

    //If imperial is selected
    if( _unitChanger.selectedSegmentIndex == 0 ) {
        //Changes inches to meters
        [subject setHeightInMeters:[NSNumber numberWithFloat:[[subject heightInMeters] floatValue] * IN_TO_M]];
        
        //Changes lbs to kg
        
        [subject setWeightInKilograms:[NSNumber numberWithFloat:[[subject weightInKilograms] floatValue] * LBS_TO_KG]];
    }
    //If metric is selected
    else{
        
        //Change cm to meters
        [subject setHeightInMeters:[NSNumber numberWithFloat:[[subject heightInMeters] floatValue] * CM_TO_M]];
        
        //Weight is fine
        
    }
    _bmiValue.lineBreakMode = NSLineBreakByWordWrapping;
    _bmiValue.numberOfLines = 0;
    //change texture for BMI
    [_bmiValue setText:[subject description]];
    
}

- (IBAction)changingUnits:(id)sender {
    
    if (_unitChanger.selectedSegmentIndex == 0){
        
        [_length_lbl setText:@"in"];
        [_weight_lbl setText:@"lbs"];
    }
    else {
        
        [_length_lbl setText:@"cm"];
        [_weight_lbl setText:@"kg"];
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.calculateBtn.enabled = self.lengthTextField.text.length > 0 && self.weightTextField.text.length > 0;
    [[self view] endEditing:YES];
}
@end

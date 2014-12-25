//
//  IEViewController.m
//  IEFractionalCalculator
//
//  Created by Ivan Espinosa on 11/2/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEViewController.h"
#import "IECalculator_Engine.h"
#import "IEFractionDisplay.h"
#import <CoreText/CoreText.h>

@interface IEViewController ()

@end

@implementation IEViewController

@synthesize numerator;
@synthesize denomator;
@synthesize waitingOperand;
@synthesize fractionPressed;
@synthesize numerFirstDigit;
@synthesize denomFirstDigit;

@synthesize displayText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    numerator = 1;
    denomator = 1;
    fractionPressed = false;
    
    
    numerFirstDigit = true;
    denomFirstDigit = true;
    
    displayText.text = @"";
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonPressed:(id)sender {

    IECalculator_Engine* cal_engine = [IECalculator_Engine sharedCalculatorEngine];

    IEFractionDisplay* equationDisplay = [IEFractionDisplay sharedEquationDisplay];
    
    NSLog(@"%i", [sender tag]);
    
    int tag = [sender tag];
    
    
    if (tag >= 0 && tag <= 9){
        
        if(!fractionPressed){
            if (!numerFirstDigit){
            
                numerator *= 10;
                numerator += tag;
                
            }else{
                
                numerFirstDigit = false;
                numerator *= tag;
            }
 
            waitingOperand = [[IEFraction_Model alloc] initWithNumerator:numerator withDenominator:1];
            [equationDisplay updateCurrentOperand:[waitingOperand description]];

        }else{
            if (!denomFirstDigit){
                denomator *= 10;
                denomator += tag;
                
            }else{
                
                denomFirstDigit = false;
                denomator *= tag;
            }
            
            waitingOperand = [[IEFraction_Model alloc] initWithNumerator:numerator withDenominator:denomator];
            [equationDisplay updateCurrentOperand:[waitingOperand description]];

        }
        
        displayText.text = [equationDisplay printEquation];
        
    }
    //Create Fraction
    else if( tag == 17){
        
        displayText.text = [displayText.text stringByAppendingFormat:@"/"];
        fractionPressed = true;
    }
    //Clear
    else if (tag == 10){
        
        [equationDisplay clear];

        displayText.text = @"";
        [cal_engine reset];
        waitingOperand = NULL;
        
        [self reset];
    }
    
    else if (tag > 10 && tag <= 16){
        
        if(tag ==  11){
            
            if (waitingOperand != NULL){
                
                waitingOperand = [waitingOperand negate];
                
                [equationDisplay updateCurrentOperand:[waitingOperand description]];
                
                displayText.text = [equationDisplay printEquation];
            }
            
            [self reset];
        }
        //Dividing
        else if( tag == 12){
            
            
            if (waitingOperand != NULL){
                
                [cal_engine store:[[IEFraction_Model alloc] initWithIEFraction:waitingOperand]withOperator:@"/"];
                
                [equationDisplay addCurrentOperand:@" ÷ "];

                
                displayText.text = [equationDisplay printEquation];
                
                
               waitingOperand = NULL;
            }
            [self reset];
        }
        
        //Multiplying
        else if( tag == 13){
            
            
            if (waitingOperand != NULL){
                
                [cal_engine store:[[IEFraction_Model alloc] initWithIEFraction:waitingOperand] withOperator:@"*"];
                
                [equationDisplay addCurrentOperand:@" × "];
                
                
                displayText.text = [equationDisplay printEquation];
                
                
                waitingOperand = NULL;
            }
            [self reset];

        }
        //Minus
        else if( tag == 14){
            if (waitingOperand != NULL){
                
                [cal_engine store:[[IEFraction_Model alloc] initWithIEFraction:waitingOperand] withOperator:@"-"];
                [equationDisplay addCurrentOperand:@" - "];
                
                displayText.text = [equationDisplay printEquation];
                
                waitingOperand = NULL;
                
            }
            
            [self reset];

        }
        //Add
        else if( tag == 15){
            
            if (waitingOperand != NULL){
                
                [cal_engine store:[[IEFraction_Model alloc] initWithIEFraction:waitingOperand] withOperator:@"+"];
                
                [equationDisplay addCurrentOperand:@" + "];
                
                
                displayText.text = [equationDisplay printEquation];
                
                waitingOperand = NULL;
                
            }

            [self reset];

        }
        //Equal
        else if( tag == 16){
            
            if (waitingOperand != NULL){
                
                [cal_engine store:[[IEFraction_Model alloc] initWithIEFraction:waitingOperand] withOperator:@"="];
                
                waitingOperand = [cal_engine result];
                
                [equationDisplay clear];

                if (waitingOperand){
                
                    
                    displayText.text = [waitingOperand simplyfiedResult];
                    [equationDisplay updateCurrentOperand:[waitingOperand description]];
    
                }
                else{
                    
                    displayText.text = @"Error";
                }
            }
            
            [cal_engine reset];
            [self reset];

        }
       
        
    }
    

}

- (void) reset{
    
    numerator = 1;
    denomator = 1;
    
    numerFirstDigit = true;
    denomFirstDigit = true;
    
    fractionPressed = false;
    

 
    
}


@end

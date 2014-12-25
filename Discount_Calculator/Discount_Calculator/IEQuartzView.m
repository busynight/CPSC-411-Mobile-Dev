//
//  IEQuartzView.m
//  Discount_Calculator
//
//  Created by Ivan Espinosa on 10/6/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEQuartzView.h"

@implementation IEQuartzView 

@synthesize dollarsOffYCoordinate;
@synthesize dollarsOffSize;
@synthesize discountYCoordinate;
@synthesize discountSize;
@synthesize addlDiscYCoordinate;
@synthesize addlDiscSize;
@synthesize total;
@synthesize dollarsOff;
@synthesize discount;
@synthesize addlDisc;
@synthesize discountTotal;
@synthesize dOffPercentage;
@synthesize discPercentage;
@synthesize addlDiscPercentage;
@synthesize discTotalPercentage;
@synthesize discTotalSize;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
// Colors the background to gray
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.opaque = YES;
        self.clearsContextBeforeDrawing = YES;
    }
    return self;
}
// Draws graph
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Drawing with a black stroke color
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
    // And drawing with a green fill color
    CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0);
    
    // Draws and fills first rectangle
    CGContextFillRect(context, CGRectMake(50.0, 50.0, 100.0, 400.0));
    CGContextStrokeRectWithWidth(context, CGRectMake(50.0, 50.0, 100.0, 400.0), 2.0);
    // Draws and fills second rectangle
    CGContextFillRect(context, CGRectMake(175.0, 50.0, 100.0, 400.0));
    CGContextStrokeRectWithWidth(context, CGRectMake(175.0, 50.0, 100.0, 400.0), 2.0);
    // Draws and fills dollars off
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, CGRectMake(175.0, dollarsOffYCoordinate, 100.0, dollarsOffSize));
    CGContextRestoreGState(context);
    CGContextStrokeRectWithWidth(context, CGRectMake(175.0, dollarsOffYCoordinate, 100.0, dollarsOffSize), 2.0);
    // Draws and fills discount
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
    CGContextFillRect(context, CGRectMake(175.0, discountYCoordinate, 100.0, discountSize));
    CGContextRestoreGState(context);
    CGContextStrokeRectWithWidth(context, CGRectMake(175.0, discountYCoordinate, 100.0, discountSize), 2.0);
    // Draws and fills addl Discount
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 0.5, 0.0, 0.5, 1.0);
    CGContextFillRect(context, CGRectMake(175.0, addlDiscYCoordinate, 100.0, addlDiscSize));
    CGContextRestoreGState(context);
    CGContextStrokeRectWithWidth(context, CGRectMake(175.0, addlDiscYCoordinate, 100.0, addlDiscSize), 2.0);
    // Prepares font and text to be used
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.0);
    CGContextSelectFont (context,
                         "Cochin",
                         10.0,
                         kCGEncodingMacRoman);
    CGContextSetCharacterSpacing (context, 1.5);
    CGContextSetTextDrawingMode (context, kCGTextStroke);
    CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0));
    // Displays dollars off, discount, addl discount, discount price, and original price text and percentages. Moves text on the sides of the graph if the size of the rectangle is too small to fit the text
    if (dollarsOffSize == 0.0){}
    else if (dollarsOffSize < 35.0) {
        CGContextShowTextAtPoint (context, 280.0, (dollarsOffYCoordinate + 5), "D.O.", 4);
        CGContextShowTextAtPoint (context, 280.0, (dollarsOffYCoordinate + 15), [dOffPercentage UTF8String], strlen([dOffPercentage UTF8String]));
    }else {
        CGContextShowTextAtPoint (context, 195.0, (dollarsOffYCoordinate + 10), "Dollars Off", 11);
        CGContextShowTextAtPoint (context, 210.0, (dollarsOffYCoordinate + ((dollarsOffSize/2) + 5)), [dollarsOff UTF8String], strlen([dollarsOff UTF8String]));
        CGContextShowTextAtPoint (context, 210.0, (dollarsOffYCoordinate + ((dollarsOffSize/2) + 15)), [dOffPercentage UTF8String], strlen([dOffPercentage UTF8String]));
    }
    if (discountSize == 0.0){}
    else if (discountSize < 35.0) {
        CGContextShowTextAtPoint (context, 151.0, (discountYCoordinate + 5), "D.%", 3);
        CGContextShowTextAtPoint (context, 151.0, (discountYCoordinate + 15), [discPercentage UTF8String], strlen([discPercentage UTF8String]));
    }else {
        CGContextShowTextAtPoint (context, 200.0, (discountYCoordinate + 10), "Discount", 8);
        CGContextShowTextAtPoint (context, 210.0, (discountYCoordinate + ((discountSize/2) + 5)), [discount UTF8String], strlen([discount UTF8String]));
        CGContextShowTextAtPoint (context, 210.0, (discountYCoordinate + ((discountSize/2) + 15)), [discPercentage UTF8String], strlen([discPercentage UTF8String]));
    }
    if (addlDiscSize == 0.0){}
    else if (addlDiscSize < 35.0) {
        CGContextShowTextAtPoint (context, 280.0, (addlDiscYCoordinate - 5), "A.D.%", 5);
        CGContextShowTextAtPoint (context, 280.0, (addlDiscYCoordinate + 5), [addlDiscPercentage UTF8String], strlen([addlDiscPercentage UTF8String]));
    }else {
        CGContextShowTextAtPoint (context, 186.0, (addlDiscYCoordinate + 10), "Add'l Discount", 14);
        CGContextShowTextAtPoint (context, 210.0, (addlDiscYCoordinate + ((addlDiscSize/2) + 5)), [addlDisc UTF8String], strlen([addlDisc UTF8String]));
        CGContextShowTextAtPoint (context, 210.0, (addlDiscYCoordinate + ((addlDiscSize/2) + 15)), [addlDiscPercentage UTF8String], strlen([addlDiscPercentage UTF8String]));
    }
    
    CGContextShowTextAtPoint (context, 196.0, (dollarsOffYCoordinate + dollarsOffSize + 10), "Total Cost", 10);
    CGContextShowTextAtPoint(context, 210.0, (dollarsOffYCoordinate + dollarsOffSize) + ((discTotalSize/2 + 5)), [discountTotal UTF8String], strlen([discountTotal UTF8String]));
    CGContextShowTextAtPoint(context, 210.0, (dollarsOffYCoordinate + dollarsOffSize) + ((discTotalSize/2 + 15)), [discTotalPercentage UTF8String], strlen([discTotalPercentage UTF8String]));
    
    CGContextShowTextAtPoint (context, 71.0, (addlDiscYCoordinate + 10), "Total Cost", 10);
    CGContextShowTextAtPoint(context, 80.0, 215.0, [total UTF8String], strlen([total UTF8String]));
    CGContextShowTextAtPoint(context, 85.0, 225.0, "100%", 4);
}
@end


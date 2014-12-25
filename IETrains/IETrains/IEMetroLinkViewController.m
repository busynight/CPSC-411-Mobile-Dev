//
//  IEMetroLinkViewController.m
//  IETrains
//
//  Created by Ivan Espinosa on 11/23/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEMetroLinkViewController.h"
#import "PDFScrollView.h"

@implementation IEMetroLinkViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
     Open the PDF document, extract the first page, and pass the page to the PDF scroll view.
     */
    NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:@"Metrolink_map" withExtension:@"pdf"];
    
    CGPDFDocumentRef PDFDocument = CGPDFDocumentCreateWithURL((__bridge CFURLRef)pdfURL);
    
    CGPDFPageRef PDFPage = CGPDFDocumentGetPage(PDFDocument, 1);
    [(PDFScrollView *)self.view setPDFPage:PDFPage];
    
    CGPDFDocumentRelease(PDFDocument);
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end

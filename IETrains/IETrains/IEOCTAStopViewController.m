//
//  IEOCTAStopViewController.m
//  IETrains
//
//  Created by Ivan Espinosa on 12/1/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEOCTAStopViewController.h"
#import "IEOCTAGTDF.h"

@interface IEOCTAStopViewController ()

@end

@implementation IEOCTAStopViewController
{
    NSArray* routes;
    
}

@synthesize stop_id_lbl;
@synthesize stop_name_lbl;
@synthesize stop_lat_lbl;
@synthesize stop_lon_lbl;
@synthesize stop_map;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    IEOCTAGTDF* octa = [IEOCTAGTDF sharedOCTA];
    routes = [octa getStopInformation:octa.selected_stop_name];
    
    stop_id_lbl.text = [routes objectAtIndex:0];
    stop_name_lbl.text = [routes objectAtIndex:2];
    stop_lat_lbl.text = [routes objectAtIndex:4];
    stop_lon_lbl.text = [routes objectAtIndex:5];
    
    double lat = [[routes objectAtIndex:4] doubleValue];
    double lon = [[routes objectAtIndex:5] doubleValue];
    
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(lat, lon);
    
    [self.stop_map setCenterCoordinate: location animated: YES];
    self.stop_map.region = MKCoordinateRegionMake(location, MKCoordinateSpanMake(0.5, 0.5));
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate: location];
    [annotation setTitle:stop_name_lbl.text];
    [self.stop_map addAnnotation:annotation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

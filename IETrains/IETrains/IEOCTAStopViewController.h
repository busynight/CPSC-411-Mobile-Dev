//
//  IEOCTAStopViewController.h
//  IETrains
//
//  Created by Ivan Espinosa on 12/1/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface IEOCTAStopViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *stop_id_lbl;
@property (weak, nonatomic) IBOutlet UILabel *stop_name_lbl;
@property (weak, nonatomic) IBOutlet UILabel *stop_lat_lbl;
@property (weak, nonatomic) IBOutlet UILabel *stop_lon_lbl;
@property (weak, nonatomic) IBOutlet MKMapView *stop_map;

@end

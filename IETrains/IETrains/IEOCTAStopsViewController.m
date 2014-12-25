//
//  IEOCTAStopsViewController.m
//  IETrains
//
//  Created by Ivan Espinosa on 12/1/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEOCTAStopsViewController.h"
#import "IEOCTAGTDF.h"

@implementation IEOCTAStopsViewController
{
    NSArray* routes;
    
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    IEOCTAGTDF* octa = [IEOCTAGTDF sharedOCTA];
    routes = [octa getStopNamesFromRoute:octa.selected_route_id];
}

-(id)initWithStyle:(UITableViewStyle)style {
    
    self = [super initWithStyle:style];
    if(self){
        
        
    }
    
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [routes count];
}

-(UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpletableIdentifier = @"SimpleTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpletableIdentifier forIndexPath:indexPath];
    
    if( cell == nil){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpletableIdentifier];
        
    }
    
    cell.textLabel.text = [routes objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    IEOCTAGTDF* octa = [IEOCTAGTDF sharedOCTA];
    octa.selected_stop_name = [routes objectAtIndex:indexPath.row ];
}
@end

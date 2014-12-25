//
//  IEOCTATableViewController.m
//  IETrains
//
//  Created by Ivan Espinosa on 12/1/14.
//  Copyright (c) 2014 __CSUF__. All rights reserved.
//

#import "IEOCTATableViewController.h"
#import "IEOCTAGTDF.h"

@implementation IEOCTATableViewController
{
    
    NSArray* routes;
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    IEOCTAGTDF* octa = [IEOCTAGTDF sharedOCTA];
    routes = [octa allRoutesList];
    
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

    cell.textLabel.text = [[routes objectAtIndex:indexPath.row ] objectAtIndex:3];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
    IEOCTAGTDF* octa = [IEOCTAGTDF sharedOCTA];
    octa.selected_route_id = [[routes objectAtIndex:indexPath.row ] objectAtIndex:0];
}

@end

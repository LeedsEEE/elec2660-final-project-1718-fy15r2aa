//
//  TableViewController.m
//  final project
//
//  Created by Rataj on 12/7/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

NSMutableArray *DataListTemp;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"Search Result";
    
    DataListTemp=[NSMutableArray array];
    self.data=[[DataModel alloc] init];
    
    Boolean bCityFound=false;
    Boolean bPriceFound=false;
    Boolean bSpaceFound=false;
    
    for (Module *object in self.data.DataList) {
        
        //handle prices
        //get all
        NSNumber *MinValuePrice=@(100000);
        NSNumber *MaxValuePrice=@(399999);
        //@"100.000$-199.999$",@"200.000$-299.999$",@"300.000$-399.999$"
        if ([_PriceForSearch isEqual:@"100.000$-199.999$"]) {
            MinValuePrice=@(100000);
            MaxValuePrice=@(199999);
        }
        else  if ([_PriceForSearch isEqual:@"200.000$-299.999$"]) {
            MinValuePrice=@(200000);
            MaxValuePrice=@(299999);
        }
        else if ([_PriceForSearch isEqual:@"300.000$-399.999$"]) {
            MinValuePrice=@(300000);
            MaxValuePrice=@(399999);
        }
        
        //handle spaces
        //get all
        NSNumber *MinValueSpace=@(500);
        NSNumber *MaxValueSpace=@(2999);
        //@"500-999sqft",@"1000-1999sqft",@"2000-2999"
        if ([_SpaceForSearch isEqual:@"500-999sqft"]) {
            MinValueSpace=@(500);
            MaxValueSpace=@(999);
        }
        else  if ([_SpaceForSearch isEqual:@"1000-1999sqft"]) {
            MinValueSpace=@(1000);
            MaxValueSpace=@(1999);
        }
        else if ([_SpaceForSearch isEqual:@"2000-2999"]) {
            MinValueSpace=@(2000);
            MaxValueSpace=@(2999);
        }
        
        if (   object.Price  >= MinValuePrice
            && object.Price  <= MaxValuePrice){
            bPriceFound=true;
        }
        else{
            bPriceFound=false;
        }
        
        if (   object.Space  >= MinValueSpace
            && object.Space  <= MaxValueSpace){
            bSpaceFound=true;
        }
        else{
            bSpaceFound=false;
        }
        
        if ([_CityForSearch isEqual:@"All Cites"]) {
            bCityFound=true;
        }
        else if(![_CityForSearch isEqual:object.City]){
            bCityFound=false;
        }
        else{
            bCityFound=true;
        }
        
        
        if (bPriceFound && bSpaceFound && bCityFound) {
            Module *DataCell1=[[Module alloc] init];
            DataCell1.Price=object.Price;
            DataCell1.Address=object.Address;
            DataCell1.Space=object.Space;
            DataCell1.City=object.City;
            DataCell1.UserID=object.UserID;
            [DataListTemp addObject:DataCell1]; //index0
        }
        
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows;
    if (section==0) {
        numberOfRows=DataListTemp.count;
    }
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ModuleCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section==0 && DataListTemp.count!=0) {//cell one
        Module *tempModule=[DataListTemp objectAtIndex:indexPath.row];
        cell.textLabel.text=tempModule.City;
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%@",tempModule.Price];
        
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ShowModuleDetails"]) {
        DetailsViewController *destinationViewController=[segue destinationViewController];
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        if (indexPath.section==0) {
            Module *tempModule=[self.data.DataList objectAtIndex:indexPath.row];
            destinationViewController.module=tempModule;
        }
    }
}


@end

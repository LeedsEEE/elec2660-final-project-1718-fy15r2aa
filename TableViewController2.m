//
//  TableViewController2.m
//  final project
//
//  Created by Rataj on 12/8/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import "TableViewController2.h"

@interface TableViewController2 ()

@end

@implementation TableViewController2
NSMutableArray *DataListTemp2;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"User Items";
    
    DataListTemp2=[NSMutableArray array];
    self.data=[[DataModel alloc] init];
    
    for (Module *object in self.data.DataList) {
        if (object.UserID==_UserID) {
            Module *DataCell1=[[Module alloc] init];
            DataCell1.Price=object.Price;
            DataCell1.Address=object.Address;
            DataCell1.Space=object.Space;
            DataCell1.City=object.City;
            DataCell1.UserID=object.UserID;
            [DataListTemp2 addObject:DataCell1];
        }
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows;
    if (section==0) {
        numberOfRows=DataListTemp2.count;
    }
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ModuleCell2" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section==0 && DataListTemp2.count!=0) {//cell one
        Module *tempModule=[DataListTemp2 objectAtIndex:indexPath.row];
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"ShowModuleDetails2"]
        || [[segue identifier] isEqualToString:@"ShowModuleDetails4"]) {
        AddViewController *destinationViewController=[segue destinationViewController];
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        if (indexPath.section==0) {
            Module *tempModule=[self.data.DataList objectAtIndex:indexPath.row];
            if ( [[segue identifier] isEqualToString:@"ShowModuleDetails4"]) {
                tempModule.Price=@(-1);
            }
            destinationViewController.module=tempModule;
        }
    }
}

@end

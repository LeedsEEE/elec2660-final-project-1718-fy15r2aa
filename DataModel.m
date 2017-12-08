//
//  DataModel.m
//  final project
//
//  Created by Rataj on 12/7/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (instancetype)init
{
    self = [super init];
    if (self && self.DataList==nil) { //not repeat init
        self.DataList=[NSMutableArray array];
        
        Module *DataCell1=[[Module alloc] init];
        DataCell1.Price=@(100000);
        DataCell1.Address=@"12st block 20";
        DataCell1.Space=@(500);
        DataCell1.City=@"London";
        DataCell1.UserID=@(1);
        
        Module *DataCell2=[[Module alloc] init];
        DataCell2.Price=@(250000);
        DataCell2.Address=@"16st block 10";
        DataCell2.Space=@(1300);
        DataCell2.City=@"Cambridge";
        DataCell2.UserID=@(1);
        
        Module *DataCell3=[[Module alloc] init];
        DataCell3.Price=@(300000);
        DataCell3.Address=@"14st block 33";
        DataCell3.Space=@(2400);
        DataCell3.City=@"Liverpool";
        DataCell3.UserID=@(1);
        
        [self.DataList addObject:DataCell1]; //index0
        [self.DataList addObject:DataCell2]; //index1
        [self.DataList addObject:DataCell3]; //index2
        
        
    }
    
    if (self && self.UserList.count==0) { //not repeat init
        self.UserList=[NSMutableArray array];
        
        Module *User=[[Module alloc] init];
        User.UserName=@"admin";
        User.Password=@"123";
        User.FullName=@"administrator";
        User.Phone=@"+447380386386";
        User.UserID=@(1);
        
        [self.UserList addObject:User]; //index0
        
    }
    return self;
}
@end

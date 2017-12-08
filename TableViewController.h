//
//  TableViewController.h
//  final project
//
//  Created by Rataj on 12/7/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "DetailsViewController.h"

@interface TableViewController : UITableViewController

@property (strong,nonatomic) DataModel *data;

@property  NSString *PriceForSearch;
@property  NSString *SpaceForSearch;
@property  NSString *CityForSearch;

@end

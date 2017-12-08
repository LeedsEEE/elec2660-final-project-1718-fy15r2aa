//
//  AddViewController.h
//  final project
//
//  Created by Rataj on 12/8/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Module.h"
#import "TableViewController2.h"


@interface AddViewController : UIViewController
@property (strong,nonatomic) Module *module;
@property (weak, nonatomic) IBOutlet UITextField *PriceOutlet;
@property (weak, nonatomic) IBOutlet UITextField *AddressOutlet;
@property (weak, nonatomic) IBOutlet UITextField *SpaceOutlet;
@property (weak, nonatomic) IBOutlet UITextField *CityOutlet;


@end




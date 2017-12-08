//
//  DetailsViewController.h
//  final project
//
//  Created by Rataj on 12/7/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Module.h"

@interface DetailsViewController : UIViewController
@property (strong,nonatomic) Module *module;

@property (weak, nonatomic) IBOutlet UILabel *PriceOutlet;
@property (weak, nonatomic) IBOutlet UILabel *AddressOutlet;


@property (weak, nonatomic) IBOutlet UILabel *SpaceOutlet;
@property (weak, nonatomic) IBOutlet UILabel *CityOutlet;
@property (weak, nonatomic) IBOutlet UILabel *FullNameOutlet;


@property (weak, nonatomic) IBOutlet UILabel *PhoneOutlet;




@end

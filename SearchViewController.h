//
//  SearchViewController.h
//  final project
//
//  Created by Rataj on 12/5/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"

@interface SearchViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *CityOutlet;
@property (weak, nonatomic) IBOutlet UIPickerView *PriceOutlet;
@property (weak, nonatomic) IBOutlet UIPickerView *SpaceOutlet;

@end

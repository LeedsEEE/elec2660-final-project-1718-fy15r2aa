//
//  DetailsViewController.m
//  final project
//
//  Created by Rataj on 12/7/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.PriceOutlet.text=[NSString stringWithFormat:@"%@ $",self.module.Price];
    self.AddressOutlet.text=self.module.Address;
    self.SpaceOutlet.text=[NSString stringWithFormat:@"%@ sqft",self.module.Space];
    self.CityOutlet.text=self.module.City;
    
    self.FullNameOutlet.text=@"administrator";
    self.PhoneOutlet.text=@"+447380386386";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

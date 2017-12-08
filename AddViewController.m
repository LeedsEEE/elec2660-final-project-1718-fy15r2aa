//
//  AddViewController.m
//  final project
//
//  Created by Rataj on 12/8/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.module!=nil && ![self.module.Price isEqual:@(-1)]) {
        self.PriceOutlet.text=[NSString stringWithFormat:@"%@ $",self.module.Price];
        self.AddressOutlet.text=self.module.Address;
        self.SpaceOutlet.text=[NSString stringWithFormat:@"%@ sqft",self.module.Space];
        self.CityOutlet.text=self.module.City;
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"ShowModuleDetails3"]
        ) {
        TableViewController2 *destinationViewController=[segue destinationViewController];
        
        destinationViewController.UserID=self.module.UserID;
        
    }
}
- (IBAction)UpdateAction:(id)sender {
    Boolean bDataValid=true;
    
    if ([@"" isEqual:self.PriceOutlet.text]
        || [@"" isEqual:self.AddressOutlet.text]
        || [@"" isEqual:self.SpaceOutlet.text]
        || [@"" isEqual:self.CityOutlet.text]
        ) {
        bDataValid=false;
    }
    if (bDataValid==false) {
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Help"
                                     message:@"Complete all fields, try again"
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        //Handle your yes please button action here
                                    }];
        [alert addAction:yesButton];
        //[alert addAction:noButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}
@end

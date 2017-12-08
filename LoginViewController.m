//
//  LoginViewController.m
//  final project
//
//  Created by Rataj on 12/7/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
NSNumber *UserID;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"SegueToNextPage2"]) {
        TableViewController2 *destinationViewController=[segue destinationViewController];
        
        destinationViewController.UserID=UserID;
        
    }
}
- (IBAction)SignInAction:(id)sender {
    DataModel *data;
    data=[[DataModel alloc] init];
    Boolean bValid=false;
    //loop through all items to check for passwork
    for (Module *object in data.UserList) {
        if ([object.UserName isEqual:self.UserNameOutlet.text]
            && [object.Password isEqual:self.PassOutlet.text]) {
            bValid=true;
            UserID=object.UserID;
        }
    }
    
    NSString *Msg=@"You have successfully logged in";
    if (bValid==false) { //success
        Msg=@"Your data is wrong, try again";
    }
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Help"
                                 message:Msg
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Ok"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                }];
    
    if (bValid==true) {//so go to the next page
        [self performSegueWithIdentifier:@"SegueToNextPage2" sender:self];
        
    }
    [alert addAction:yesButton];
    //[alert addAction:noButton];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
    @end

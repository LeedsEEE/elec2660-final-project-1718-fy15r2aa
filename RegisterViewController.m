//
//  RegisterViewController.m
//  final project
//
//  Created by Rataj on 12/7/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)RegisterAction:(id)sender {
    DataModel *data=[[DataModel alloc] init];
    Boolean bUserValid=true;
    Boolean bDataValid=true;
    NSNumber *LastUserID=@(1);
    
    //loop through all items to check for repeated username
    for (Module *object in data.UserList) {
        if ([object.UserName isEqual:self.UserNameOutlet.text]
            ) {
            bUserValid=false;
        }
        LastUserID=object.UserID;
    }
    if ([@"" isEqual:self.UserNameOutlet.text]
        || [@"" isEqual:self.PassOutlet.text]
        || [@"" isEqual:self.FullNameOutlet.text]
        || [@"" isEqual:self.PhoneOutlet.text]
        ) {
        bDataValid=false;
    }
    
    NSString *Msg=@"You have successfully registered";
    if (bDataValid==false) { //fail
        Msg=@"Complete all fields, try again";
    }
    
    if (bDataValid==true && bUserValid==false) { //fail
        Msg=@"User already found, try again";
    }
    
    if (bDataValid==true && bUserValid==true) {//begin register user
        Module *newUser=[[Module alloc] init];
        newUser.UserName=_UserNameOutlet.text;
        newUser.Password=self.PassOutlet.text;
        newUser.FullName=self.FullNameOutlet.text;
        newUser.Phone=self.PhoneOutlet.text;
        
        newUser.UserID=@(LastUserID.intValue+1);
        
        [data.UserList addObject:newUser]; //index0
        
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
    [alert addAction:yesButton];
    //[alert addAction:noButton];
    [self presentViewController:alert animated:YES completion:nil];}

@end

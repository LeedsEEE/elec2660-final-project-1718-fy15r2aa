//
//  RegisterViewController.h
//  final project
//
//  Created by Rataj on 12/7/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "Module.h"


@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *UserNameOutlet;
@property (weak, nonatomic) IBOutlet UITextField *PassOutlet;
@property (weak, nonatomic) IBOutlet UITextField *FullNameOutlet;
@property (weak, nonatomic) IBOutlet UITextField *PhoneOutlet;

@end

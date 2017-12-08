//
//  Module.h
//  final project
//
//  Created by Rataj on 12/7/17.
//  Copyright © 2017 Rataj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Module : NSObject

@property  NSNumber *Price;
@property (nonatomic,strong) NSString *Address;
@property  NSNumber *Space;
@property (nonatomic,strong) NSString *City;
@property  NSNumber *UserID;

@property (nonatomic,strong) NSString *UserName;
@property (nonatomic,strong) NSString *Password;
@property (nonatomic,strong) NSString *FullName;
@property (nonatomic,strong) NSString *Phone;
@end

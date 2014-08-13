//
//  ViewController.h
//  EpiLog
//
//  Created by Apollo on 08/08/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userTableView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *loginField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) userTableView *userList;

@end

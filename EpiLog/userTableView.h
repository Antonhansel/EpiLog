//
//  userTableView.h
//  EpiLog
//
//  Created by Apollo on 13/08/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "reportView.h"

@interface userTableView : UITableViewController

@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *password;
-(void)setRequest: (NSString*)savedLogin :(NSString *)savedPassword;

@property (assign, nonatomic) NSInteger studentNumber;
@property (strong, nonatomic) NSArray *userLogin;
@property (strong, nonatomic) reportView *userReport;
@end

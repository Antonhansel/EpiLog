//
//  reportView.h
//  EpiLog
//
//  Created by Apollo on 12/08/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"

@interface reportView : UIViewController

@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *targetLogin;
-(void)setRequest: (NSString*)savedLogin :(NSString *)savedPassword :(NSString*)targetLogin;
@property (strong, nonatomic) UIImageView *profilePic;
@property (strong, nonatomic) NSString *profilePicAddress;
@property (strong, nonatomic) IBOutlet UILabel *loginLabel;


@end

//
//  reportView.m
//  EpiLog
//
//  Created by Apollo on 12/08/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "reportView.h"

@interface reportView ()
@end

@implementation reportView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithRed:51.0/255 green:52.0/255 blue:55.0/255 alpha:1.0];
    }
    return self;
}

-(void)setRequest: (NSString*)savedLogin :(NSString *)savedPassword :(NSString*)targetLogin
{
    self.login = savedLogin;
    self.password = savedPassword;
    self.targetLogin = targetLogin;
    self.profilePicAddress = [[NSString alloc] init];
    self.profilePicAddress = @"https://cdn.local.epitech.eu/userprofil/profilview/";
    NSMutableString *profileURL = [[NSMutableString alloc] init];
    self.profilePic = [[UIImageView alloc] init];
    self.profilePic.frame = CGRectMake(20, 70, 150, 170);
    [profileURL appendString:self.profilePicAddress];
    [profileURL appendString:self.targetLogin];
    [profileURL appendString:@".jpg"];
    [self.profilePic setImageWithURL:[NSURL URLWithString:profileURL] placeholderImage:[UIImage imageNamed:@"placeholder.gif"]];
    [self.loginLabel setText:self.login];
    [self.view addSubview:self.profilePic];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

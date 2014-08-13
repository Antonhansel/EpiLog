//
//  userTableView.m
//  EpiLog
//
//  Created by Apollo on 13/08/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "userTableView.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@interface userTableView ()

@end

@implementation userTableView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.studentNumber = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setRequest: (NSString*)savedLogin :(NSString *)savedPassword
{
    self.login = savedLogin;
    self.password = savedPassword;
    NSMutableString *loginRequest = [[NSMutableString alloc] init];
    [loginRequest appendString:@"http://ws.paysdu42.fr/JSON/?action=get_logins&auth_login="];
    [loginRequest appendString:self.login];
    [loginRequest appendString:@"&auth_password="];
    [loginRequest appendString:self.password];
    [loginRequest appendString:@"&school=epitech&promo=2017&city=lyon"];
    NSURL *url = [[NSURL alloc] initWithString:[loginRequest stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSError* error;
         NSDictionary* json = [NSJSONSerialization
                               JSONObjectWithData:responseObject
                               options:kNilOptions
                               error:&error];
         if ([@"none" isEqualToString:json[@"error"]])
         {
             self.userLogin = [[NSArray alloc] init];
             self.userLogin = json[@"result"];
             self.studentNumber = self.userLogin.count;
             [self.tableView reloadData];
         }
         else
         {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Impossible to retrieve Data"
                                                             message:json[@"error"]
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
                                                    [alert show];
         }
     }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connexion failed"
                                                         message:@"Impossible to connect to the internet"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
         [alert show];
         NSLog(@"fail %@", error.localizedDescription);
     }];
    [operation start];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)      tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.userReport = [[reportView alloc] init];
    [self.userReport setRequest:self.login :self.password :self.userLogin[indexPath.row]];
    self.userReport.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:self.userReport animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.studentNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Title"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Title"];
    }
    cell.textLabel.text = self.userLogin[indexPath.row];
    return cell;
}

@end

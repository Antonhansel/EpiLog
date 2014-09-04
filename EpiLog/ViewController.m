//
//  ViewController.m
//  EpiLog
//
//  Created by Apollo on 08/08/14.
//  Copyright (c) 2014 com.iosHello. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:51.0/255 green:52.0/255 blue:55.0/255 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tapOutside:(id)sender
{
    [self.loginField resignFirstResponder];
    [self.passwordField resignFirstResponder];

}

- (IBAction)testLogin:(id)sender
{
    NSMutableString *loginRequest = [[NSMutableString alloc] init];

    [loginRequest appendString:@"http://ws.paysdu42.fr/JSON/?action=login&auth_login="];
    [loginRequest appendString:self.loginField.text];
    [loginRequest appendString:@"&auth_password="];
    [loginRequest appendString:self.passwordField.text];
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
            self.userList = [[userTableView alloc] initWithStyle:UITableViewStylePlain];
            [self.userList setRequest:self.loginField.text :self.passwordField.text];
            self.userList.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:self.userList animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Impossible to connect"
                                                            message:json[@"error"]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        //
        NSLog(@"fail %@", error.localizedDescription);
    }];
    [operation start];
}

@end

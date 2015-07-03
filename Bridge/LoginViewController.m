//
//  LoginViewController.m
//  Bridge
//
//  Created by Kunal Shah on 6/21/15.
//  Copyright (c) 2015 Kunal Shah. All rights reserved.
//

#import "LoginViewController.h"




@interface LoginViewController ()

@end

@implementation LoginViewController
UIGestureRecognizer *tapper;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _passwordtextView.secureTextEntry = YES;
    tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
    
   

}

-(void)handleSingleTap: (UIGestureRecognizer *)sender{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}



- (IBAction)LoginUser:(id)sender {
    [PFUser logInWithUsernameInBackground:_emailtextView.text password:_passwordtextView.text block:^(PFUser *user, NSError *error) {
        if (!error) {
            NSLog(@"Login user!");
            _emailtextView.text = nil;
            _passwordtextView.text = nil;
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh No!" message:@"Sorry we had a problem logging you in" delegate:self cancelButtonTitle:@"Okie Dokie" otherButtonTitles:nil];
            [alert show];
            [self currentuser];
            
        }
    }];
    
    
}


- (IBAction)LoginUserbtn:(id)sender {
    [PFUser logInWithUsernameInBackground:_emailtextView.text password:_passwordtextView.text block:^(PFUser *user, NSError *error) {
        if (!error) {
            NSLog(@"Login user!");
            _emailtextView.text = nil;
            _passwordtextView.text = nil;
            
            
            [self performSegueWithIdentifier:@"login2" sender:self];
        }
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh No!" message:@"Sorry we had a problem logging you in" delegate:self cancelButtonTitle:@"Okie Dokie" otherButtonTitles:nil];
            [alert show];
            [self currentuser];
        }
    }];
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"login"]){
        return YES;
    }
    return NO;
}

- (BOOL)shouldPerformSegueWithIdentifier2:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"login2"]){
        return YES;
    }
    return NO;
}

- (void) currentuser {
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
    } else {
        // show the signup or login screen
    }
    
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


@end

//
//  SignUpViewController.m
//  Bridge
//
//  Created by Kunal Shah on 6/23/15.
//  Copyright (c) 2015 Kunal Shah. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController
UIGestureRecognizer *tapper2;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _passwordtextView.secureTextEntry = YES;
    _reenterpasswordtextView.secureTextEntry = YES;
    
    tapper2 = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper2.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper2];
    
    

    
    
}

-(void)handleSingleTap: (UIGestureRecognizer *)sender{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(IBAction)LoginUser:(id)sender {
 
    NSLog(@"registering....");
    PFUser *newUser = [PFUser user];
    newUser.username = _emailtextView.text;
    newUser.password = _passwordtextView.text;
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Registration Success!");
            _emailtextView.text = nil;
            _passwordtextView.text = nil;
            _reenterpasswordtextView.text = nil;
            
            [self performSegueWithIdentifier:@"login2" sender:self];
        }
        else {
            NSLog(@"There was an error in registration");
        }
    }];
    [self checkFieldsComplete];
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"login2"]){
        return YES;
    }
    return NO;
}

-(IBAction)LoginUserbtn:(id)sender {
    
    NSLog(@"registering....");
    PFUser *newUser = [PFUser user];
    newUser.username = _emailtextView.text;
    newUser.password = _passwordtextView.text;
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Registration Success!");
            _emailtextView.text = nil;
            _passwordtextView.text = nil;
            _reenterpasswordtextView.text = nil;
            
            [self performSegueWithIdentifier:@"login2" sender:self];
        }
        else {
            NSLog(@"There was an error in registration");
        }
    }];

    [self checkFieldsComplete];
    
}

- (BOOL)shouldPerformSegueWithIdentifier2:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"login2"]){
        return YES;
    }
    return NO;
}


- (void) checkFieldsComplete {
    if ([_emailtextView.text isEqualToString:@""] || [_passwordtextView.text isEqualToString:@""] || [_reenterpasswordtextView.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh No!" message:@"You need to complete all fields." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self checkPasswordsMatch];
    }
}

- (void) checkPasswordsMatch {
    
    //check that the two password fields are identical
    if ([_passwordtextView.text isEqualToString:_reenterpasswordtextView.text]) {
        NSLog(@"passwords match!");
        
        
    }
    else {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Uh-Oh!" message:@"The passwords entered do not match." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        
        [error show];
    }
    
}

-(void)registerNewUser{
    NSLog(@"registering....");
    PFUser *newUser = [PFUser user];
    newUser.username = _emailtextView.text;
    newUser.password = _passwordtextView.text;
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Registration Success!");
            _emailtextView.text = nil;
            _passwordtextView.text = nil;
            _reenterpasswordtextView.text = nil;
        }
        else {
            NSLog(@"There was an error in registration");
        }
    }];
    [self performSegueWithIdentifier:@"login" sender:self];
    
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

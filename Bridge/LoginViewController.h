//
//  LoginViewController.h
//  Bridge
//
//  Created by Kunal Shah on 6/21/15.
//  Copyright (c) 2015 Kunal Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface LoginViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *emailtextView;

@property (retain, nonatomic) IBOutlet UITextField *passwordtextView;

@property (assign,nonatomic) IBOutlet UIButton *loginBtn;

@property (assign,nonatomic) IBOutlet UIButton *loginBtnoutline;


-(IBAction)LoginUser:(id)sender;
-(IBAction)LoginUserbtn:(id)sender;


@end

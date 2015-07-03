//
//  SignUpViewController.h
//  Bridge
//
//  Created by Kunal Shah on 6/23/15.
//  Copyright (c) 2015 Kunal Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface SignUpViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *emailtextView;

@property (retain, nonatomic) IBOutlet UITextField *passwordtextView;

@property (retain, nonatomic) IBOutlet UITextField *reenterpasswordtextView;

@property (assign,nonatomic) IBOutlet UIButton *loginBtn;

@property (assign,nonatomic) IBOutlet UIButton *loginBtnoutline;


-(IBAction)LoginUser:(id)sender;
-(IBAction)LoginUserbtn:(id)sender;


@end

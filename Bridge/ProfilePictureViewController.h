//
//  ProfilePictureViewController.h
//  Bridge
//
//  Created by Kunal Shah on 6/17/15.
//  Copyright (c) 2015 Kunal Shah. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "DBCameraViewController.h"
#import "DBCameraContainerViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>


@interface ProfilePictureViewController : UIViewController <DBCameraViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)logout:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;


- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;
- (IBAction)next:(id)sender;





@end

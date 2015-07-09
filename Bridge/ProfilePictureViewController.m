//
//  ProfilePictureViewController.m
//  Bridge
//
//  Created by Kunal Shah on 6/17/15.
//  Copyright (c) 2015 Kunal Shah. All rights reserved.
//

#import "ProfilePictureViewController.h"
#import "TestViewController.h"
#import "FeedViewController.h"


@interface ProfilePictureViewController ()

@end

@implementation ProfilePictureViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)next:(id)sender {
    
   // if (self.imageView.image) {
        
        //[self performSegueWithIdentifier:@"next" sender:self];
        
       /* NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
        PFFile *photoFile = [PFFile fileWithData:imageData];
        PFObject *photo = [PFObject objectWithClassName:@"User"];
        photo [@"profilepic"] = photoFile;
        photo [@"username"] = [PFUser currentUser];
        [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!succeeded) {
                [self showError];
            }
        }];
    }
        else {
            [self showError];
                    }*/
        
   
}


    

- (void)showError {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Could not post your photo, please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
//-----------------------------------PREPARE FOR SEGUE ********SUPER IMPORTANT**********------------------------------------
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"next"]) {
        FeedViewController *destViewController = segue.destinationViewController;
        //destViewController.feedtext = @"It fucking worked";
        NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
        PFFile *photoFile = [PFFile fileWithData:imageData];
        PFObject *photo = [PFObject objectWithClassName:@"User"];
        photo [@"profilepic"] = photoFile;
        photo [@"username"] = [PFUser currentUser];
        [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!succeeded) {
                [self showError];
            }
        }];
    }
    else {
        [self showError];
    }
}
    
    




@end


//
//  SplashScreenViewController.m
//  Pods
//
//  Created by Kunal Shah on 6/18/15.
//
//

#import "SplashScreenViewController.h"
#import "CBZSplashView.h"
#import "CBZRasterSplashView.h"
#import "CBZVectorSplashView.h"


@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

- (void)viewDidAppear:(BOOL)animated
{
     [super viewDidAppear:animated];
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self performSegueWithIdentifier:@"custom" sender:self];
    });
    UIImage *icon = [UIImage imageNamed:@"blogo.png"];
    UIColor *color = [UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1];
    CBZSplashView *splashView = [CBZSplashView splashViewWithIcon:icon backgroundColor:color];

    [self.view addSubview:splashView];
    
    [splashView startAnimation];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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

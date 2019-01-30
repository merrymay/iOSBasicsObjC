//
//  TestNavViewController.m
//  iOSBasicsObjC
//
//  Created by kyoung hee park on 18/01/2019.
//  Copyright © 2019 MayPark. All rights reserved.
//

#import "TestNavViewController.h"

@interface TestNavViewController ()

@end

@implementation TestNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"TestNavViewController"); // 44 + 44, 20 + 44, 20 + 44
    
    self.title = @"Hello~";
    
    CGFloat topbarHeight = ([UIApplication sharedApplication].statusBarFrame.size.height +
                            (self.navigationController.navigationBar.frame.size.height ?: 0.0));
    NSLog(@"statusBarFrame = %f", [UIApplication sharedApplication].statusBarFrame.size.height);
    NSLog(@"navigationBar = %f", self.navigationController.navigationBar.frame.size.height);
    
//    // nav height +++++ 14
//    // Note that images configured as the back bar button's background do
//    // not have the current tintColor applied to them, they are displayed as it.
//    UIImage *backButtonBackgroundImage = [UIImage imageNamed:@"back"];//iconArrLLarge
//    // The background should be pinned to the left and not stretch.
//    backButtonBackgroundImage =
//    [backButtonBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonBackgroundImage.size.width - 1, 0, 0)];
//    
////    id barAppearance =
////    [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[TestNavViewController class]]];
////    [barAppearance setBackIndicatorImage:backButtonBackgroundImage];
////    [barAppearance setBackIndicatorTransitionMaskImage:backButtonBackgroundImage];
//    UINavigationBar.appearance.backIndicatorImage = backButtonBackgroundImage;
//    UINavigationBar.appearance.backIndicatorTransitionMaskImage = backButtonBackgroundImage;

    
    
    
    // Provide an empty backBarButton to hide the 'Back' text present by
    // default in the back button.
    //
    // NOTE: You do not need to provide a target or action.  These are set
    //       by the navigation bar.
    // NOTE: Setting the title of this bar button item to ' ' (space) works
    //       around a bug in iOS 7.0.x where the background image would be
    //       horizontally compressed if the back button title is empty.
//    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@" "
//                                                                      style:UIBarButtonItemStylePlain
//                                                                     target:nil
//                                                                     action:nil];
//    self.navigationItem.backBarButtonItem = backBarButton;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    

   
    
 
}
@end

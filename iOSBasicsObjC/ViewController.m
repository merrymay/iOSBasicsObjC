//
//  ViewController.m
//  iOSBasicsObjC
//
//  Created by kyoung hee park on 04/12/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "iOSBasicsObjC-Swift.h"




@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];

    UIView *sampleView = [[UIView alloc]init];
    sampleView.translatesAutoresizingMaskIntoConstraints = NO;
     
 
    sampleView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sampleView];
    
    
//    if (@available(iOS 11.0, *)) {
//        UILayoutGuide * guide = self.view.safeAreaLayoutGuide;
//        [sampleView.topAnchor constraintEqualToAnchor:guide.topAnchor].active = YES;
//        [sampleView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor].active = YES;
//    } else {
//
//    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MyNetworkManager *mgr = [[MyNetworkManager alloc] init];
    [mgr sendSimpleHttpRequestUsingAlmofireWithSuccess:^(SampleJson * data) {
        
        NSLog(@">>> Success Block = %@", data.companies[0]);
        
        self.myLabel.text = data.companies[0];
        
    } failure:^(NSError * error) {
        NSLog(@">>> Fail Block = %@", error);
    }];
 
    [mgr testNetworkWrapper];
    
 
     // AFNetwork
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//
//    NSURL *URL = [NSURL URLWithString:@"https://api.myjson.com/bins/vi56v"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//
//    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        if (error) {
//            NSLog(@"Error: %@", error);
//        } else {
//            NSLog(@"%@ %@", response, responseObject);
//        }
//    }];
//    [dataTask resume];
    
    
}


@end

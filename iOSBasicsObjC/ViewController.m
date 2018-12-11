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
#import "CocoaLumberjack.h"
#import "Masonry.h"


static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

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
    
    [self testSnapKit];
    
    // Test Lumberjack logger
    [self testLumberjackLogger];
    
    
}

- (void)testSnapKit {
    UIView *sampleView = [[UIView alloc]init];
    sampleView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:sampleView];
    
    [sampleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
}

- (void)testLumberjackLogger {
    [DDLog addLogger:[DDOSLogger sharedInstance]]; // Uses os_log
    
    // File logger : device app container 의 cache folder 에 저장됨
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; // File Logger
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger];
    
    DDLogVerbose(@"Meet George Jetson");
    
    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
}
@end

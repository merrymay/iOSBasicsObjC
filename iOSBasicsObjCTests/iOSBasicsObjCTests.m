//
//  iOSBasicsObjCTests.m
//  iOSBasicsObjCTests
//
//  Created by kyoung hee park on 04/12/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AFNetworking.h"
 
 

@interface iOSBasicsObjCTests : XCTestCase

@end

@implementation iOSBasicsObjCTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testMySample {
//    MyNetworkManager *mgr = [[MyNetworkManager alloc] init];
//    [mgr sendSimpleHttpRequestUsingAlmofireWithSuccess:^(SampleJson * data) {
//
//        NSLog(@">>> Success Block = %@", data.companies[0]);
//
//        XCTAssertEqual(data.companies[0], "Apple", "*** Fail ***")
//
//    } failure:^(NSError * error) {
//        NSLog(@">>> Fail Block = %@", error);
//    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

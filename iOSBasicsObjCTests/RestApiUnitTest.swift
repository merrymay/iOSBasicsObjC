//
//  RestApiUnitTest.swift
//  iOSBasicsObjCTests
//
//  Created by kyoung hee park on 06/12/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

import XCTest
import Alamofire


class RestApiUnitTest: XCTestCase {
    
    
    var sessionUnderTest: URLSession! // to test network operations

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sessionUnderTest = nil
        super.tearDown()

    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        MyNetworkManager().sendSimpleHttpRequestUsingAlmofire(success: { (data) in
            XCTAssertEqual(data.companies[0], "Apple", "*** Fail ***")
        }) { (error) in
            XCTFail("*** Error ***")
        }
    }
    
    func testNetworkWrapper(){
        let networkRequest: NetworkRequest = RealNetworkRequest()
        networkRequest.request(URL(string: "https://api.myjson.com/bins/vi56v")!, method: HTTPMethod.get, parameters: nil, headers: nil) { (result) in
            
        }
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToiTunesGetsHTTPStatusCode200() {
        // given
        let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba") // success case
        //let url = URL(string: "https://itune.apple.com/search?media=music&entity=song&term=abba") // fail case

        
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }
    

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

//
//  SampleJson.swift
//  iOSBasicsObjC
//
//  Created by kyoung hee park on 04/12/2018.
//  Copyright © 2018 MayPark. All rights reserved.

import Foundation
import Alamofire


// Sample JSON Struct - Codable protocol (Encodable, Decodable)
@objc class SampleJson:  NSObject, Codable {
    @objc var companies: [String]
}

@objc class MyNetworkManager : NSObject {
    
    @objc func testNetworkWrapper(){
        RealNetworkRequest().request(URL(string: "https://api.myjson.com/bins/vi56v")!, method: HTTPMethod.get, parameters: nil, headers: nil) { (result) in

            switch result {
            case .success(let data):
                let decode = try! JSONDecoder().decode(SampleJson.self, from:data )
                print("######## testNetworkWrapper. decode = \(decode.companies[0])")
            default:
                fatalError()
            }
        }

    }
    
    
    // from swift 4.2 @objc keyword needed
    @objc func sendSimpleHttpRequestUsingAlmofire(success:@escaping (SampleJson) -> Void, failure: @escaping (Error) -> Void)   {
        
        Alamofire.request("https://api.myjson.com/bins/vi56v") // https://httpbin.org/get
            .responseJSON { (response) in
                
                print(response.request ?? "request is nil")
                print(response.response ?? "response is nil")
                print(response.data ?? "data is nil")
                print(response.result)
                
                
                if response.result.isFailure {
                    failure(response.result.error!)
                }
                
                
                if response.result.isSuccess {
                    if let jsonData = response.result.value {
                        print("JSON: \(jsonData)")
                    }
                    
                    let decode = try! JSONDecoder().decode(SampleJson.self, from: response.data!)
                    print("*** JSON Decoded  = \(decode)")
                    
                    success(decode)
                }
                
        }
    }
}

//
//  AlamofireWrapper.swift
//  iOSBasicsObjC
//
//  Created by kyoung hee park on 04/12/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

import Foundation
import Alamofire


// https://medium.com/cocoaacademymag/unit-testing-network-request-3a75061fcf4c

public enum Result<T> {
    case success(T)
    case error
}

public protocol NetworkRequest {
    func request(
        _ url: URL,
        method: HTTPMethod,
        parameters: [String: Any]?,
        headers: [String: String]?,
        completion: @escaping (Result<Data>) -> Void) -> Void
}

public class RealNetworkRequest: NetworkRequest {
    
    public func request(_ url: URL, method: HTTPMethod, parameters: [String : Any]?, headers: [String : String]?, completion: @escaping (Result<Data>) -> Void) {
        
        Alamofire.request(url,
                          method: method,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: headers).responseJSON(completionHandler: { (response) in
                            if let data = response.data {
                                completion(.success(data))
                            } else {
                                completion(.error)
                            }
                          })
    }
}

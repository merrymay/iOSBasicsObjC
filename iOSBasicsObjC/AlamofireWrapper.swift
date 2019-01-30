//
//  AlamofireWrapper.swift
//  iOSBasicsObjC
//
//  Created by kyoung hee park on 04/12/2018.
//  Copyright © 2018 MayPark. All rights reserved.
//

import Foundation
import Alamofire
import CocoaLumberjack

// https://medium.com/cocoaacademymag/unit-testing-network-request-3a75061fcf4c

public enum Result<T> {
    case success(T)
    case error
    case noData
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
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                DDLogError("returned error")
                completion(.error)
                return
            }
            
            guard let content = data else {
                DDLogWarn("No data")
                completion(.noData)
                return
            }
            
            completion(.success(content))
        }
        task.resume()
        
//        Alamofire.request(url,
//                          method: method,
//                          parameters: parameters,
//                          encoding: URLEncoding.default,
//                          headers: headers).responseJSON(completionHandler: { (response) in
//                            if let data = response.data {
//                                completion(.success(data))
//                            } else {
//                                completion(.error)
//                            }
//                          })
    }
}

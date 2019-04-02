//
//  AccessTokenAdapter.swift
//  AlamofireProject
//
//  Created by MacBook Pro on 22/03/2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import Alamofire
//class AccessTokenAdapter: RequestAdapter {
//
//
//    private let accessToken: String
//
//    init(accessToken: String) {
//        self.accessToken = accessToken
//    }
//    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest>) -> Void) {
//        var urlRequest = urlRequest
//
//        if (urlRequest.url != nil) {
//
//            urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
//        }
//
//        return urlRequest
//    }
//    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
//
//    }
//}
//class OAuth2Handler: RequestAdapter, RequestRetrier {
//    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest>) -> Void) {
//        <#code#>
//    }
//    
//    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
//        <#code#>
//    }
//    
//    public func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: RequestRetryCompletion) {
//        if let response = request.task.response as? HTTPURLResponse, response.statusCode == 401 {
//            completion(true, 1.0) // retry after 1 second
//        } else {
//            completion(false, 0.0) // don't retry
//        }
//    }
//}

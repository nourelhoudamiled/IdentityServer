//
//  Client.swift
//  AlamofireProject
//
//  Created by MacBook Pro on 21/03/2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import OAuthSwift
final class Client {
//    private let manager: AF.SessionManager
//    private let baseURL = URL(string: "<your_server_base_url>")!
//    private let queue = DispatchQueue(label: "<your_queue_label>")
//    
//    init(accessToken: String) {
//        var defaultHeaders = AF.SessionManager.defaultHTTPHeaders
//        defaultHeaders["Authorization"] = "Bearer \(accessToken)"
//        
//        let configuration = URLSessionConfiguration.default
//        
//        // Add `Auth` header to the default HTTP headers set by `Alamofire`
//        configuration.httpAdditionalHeaders = defaultHeaders
//        
//        self.manager = Alamofire.SessionManager(configuration: configuration)
//        self.manager.retrier = OAuth2Retrier()
//    }
//    
//    func request<Response>(_ endpoint: Endpoint<Response>) -> Single<Response> {
//        return Single<Response>.create { observer in
//            let request = self.manager.request(
//                self.url(path: endpoint.path),
//                method: httpMethod(from: endpoint.method),
//                parameters: endpoint.parameters
//            )
//            request
//                .validate()
//                .responseData(queue: self.queue) { response in
//                    let result = response.result.flatMap(endpoint.decode)
//                    switch result {
//                    case let .success(val): observer(.success(val))
//                    case let .failure(err): observer(.error(err))
//                    }
//            }
//            return Disposables.create {
//                request.cancel()
//            }
//        }
//    }
//    
//    private func url(path: Path) -> URL {
//        return baseURL.appendingPathComponent(path)
//    }
}

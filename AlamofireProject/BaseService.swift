//
//  BaseService.swift
//  AlamofireProject
//
//  Created by MacBook Pro on 21/03/2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import Alamofire
import OAuthSwift
import p2_OAuth2
import UIKit

final class BaseService: OAuth2PasswordGrantDelegate
    
{
   // var manager: Manager?
    
   
    
   var text:String = ""
    public var oauth2: OAuth2PasswordGrant
  
    init(clientID: String, clientSecret: String, username: String, password: String) {
        oauth2 = OAuth2PasswordGrant(settings: [
            "client_id": clientID,
            "client_secret": clientSecret,
            "authorize_uri": "",
            "token_uri": "https://clocation-idserver.azurewebsites.net/connect/token",
            "grant_type": "password",
            "scope": "api1",
            "keychain": false,
            "verbose": true
            ] as OAuth2JSON)
        oauth2.username = username
        oauth2.password = password
      
        oauth2.delegate = self
    }
 
  
    
    public func authorize(presenting view: UIViewController , texttoken : String) {
       // oauth2.authConfig.authorizeContext = view
        oauth2.logger = OAuth2DebugLogger(.trace)
        var token = ""
       // oauth2.verbose = true
        // as far as I know now, the following if-request is not necessary
        // because "authorizeEmbedded" is checking it already
        if oauth2.isAuthorizing {
            oauth2.abortAuthorization()
            print("ee")
          
            return
        }
        
        if let view = view as? OAuth2PasswordGrantDelegate {
            oauth2.delegate = view
        }
  
        oauth2.authorizeEmbedded(from: view) { (authParams, error) in
            if let au = authParams {
          
                token = (au["access_token"] as! String?)!
                AppManager.shared.token = token
                UserDefaults.standard.set(token, forKey: "Token")
        guard let beare = au["token_type"] as! String? else { return}
                print("The value of token is \(beare+token)")
                let headers : HTTPHeaders = [
                                    "Authorization": "\(beare) \(token) "]
                                print("e")
                                print(headers)

            var urlRequest = URLRequest(url: URL(string: "http://clocation.azurewebsites.net/api/users")!)
      let urlString = urlRequest.url?.absoluteString
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
    AF.request(urlString!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
   
   
                                        print(response.request as Any)  // original URL request
                                        print(response.response as Any) // URL response
                                       print(response.result.value as Any)
        // result of response serialization
      
//        //set value inside a userdefault
//         UserDefaults.standard.set(true, forKey: "LOGGED_IN")
//        //saved to the device
//        UserDefaults.standard.synchronize()
    
        
     
        
                                }
                
                
                }}
                else {
                UserDefaults.standard.setIsLoggedIn(value: false)
                    print("Authorization was canceled or went wrong: \(String(describing: error?.description))")
                }
            }
            

        
    }
  
    
    public func loginController(oauth2: OAuth2PasswordGrant) -> AnyObject {
        if let vc = oauth2.authConfig.authorizeContext as? UIViewController {
            vc.present(LoginViewController(), animated: true)
        }
        return LoginViewController()
    }
    
}

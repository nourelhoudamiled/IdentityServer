//b3thto el houssam

//
//  LoginViewController.swift
//  AlamofireProject
//
//  Created by MacBook Pro on 21/03/2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftKeychainWrapper

class LoginViewController: UIViewController {
    var loginService: BaseService?
    var textz:String?
    @IBOutlet var pswTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  loginService = BaseService(clientID: "postman-api", clientSecret: "secret", username: "alice", password: "Pass123$")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func prepare(for segue : UIStoryboardSegue , sender : Any?)
    {
        if (segue.identifier == "goToHome") {
            let vc = segue.destination as! MainViewController
            
            
        }
        
        
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        let userLoggedIn = UserDefaults.standard.bool(forKey: "LOGGED_IN")
        
        let token = loginService?.oauth2.accessToken
        
        if (!userLoggedIn || (userLoggedIn && token == nil))  {
         
            loginService = BaseService(clientID: "postman-api", clientSecret: "secret", username: nameTextField.text!, password: pswTextField.text!)

            loginService?.authorize(presenting: self, texttoken: "")
             UserDefaults.standard.setIsLoggedIn(value: true)
            let prefs:UserDefaults = UserDefaults.standard
         
            prefs.set(1, forKey: "IsLoggedIn")
            prefs.synchronize()
        self.textz = "nourelhouda"
         self.performSegue(withIdentifier: "goToHome", sender: self)
        }

//        let parameters: Parameters = [
//            "grant_type": "password_credentials",
//
//            "redirect_uri" : "clocation.azurewebsites.net/api/users",
//            "client_id" : "postman-api",
//            "client_secret" : "secret",
//            "scope" : "api1"
//        ]
//        let user = nameTextField.text!
//        let password = pswTextField.text!
//        AF.request("https://clocation-idserver.azurewebsites.net/connect/token", method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
//            .authenticate(username: user, password: password)
//            .responseJSON { response in
//                print("request: \(String(describing: response.request))")  // original URL request
//
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//        }
        }
     
//        self.nameTextField.resignFirstResponder()
//            self.pswTextField.resignFirstResponder()
//
//            if (self.nameTextField.text == "" || self.pswTextField.text == "") {
//            let alertView = UIAlertController(title: "Login failed",
//                                              message: "Wrong username or password." as String, preferredStyle:.alert)
//                let okAction = UIAlertAction(title: "Try Again!", style: .default, handler: nil)
//                alertView.addAction(okAction)
//                self.present(alertView, animated: true, completion: nil)
//                return
//            }
//
//            // Check if the user entered an email
//            if let actualUsername = self.nameTextField.text {
//
//                // Check if the user entered a password
//                if let actualPassword = self.pswTextField.text {
//
//                    // Build the body message to request the token to the web app
//                    let bodyStr = "grant_type=password&client_id=postman-api&client_secret=secret&username=" + actualUsername + "&password=" + actualPassword
//
//                    // Setup the request
//                    let myURL = NSURL(string: "https://clocation-idserver.azurewebsites.net/connect/token")!
//                    let request = NSMutableURLRequest(url: myURL as URL)
//                    request.httpMethod = "GET"
//                    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//                    request.setValue("application/json", forHTTPHeaderField: "Accept")
//                    request.httpBody = bodyStr.data(using: String.Encoding.utf8)!
//
//                    let task = URLSession.shared.dataTask(with: request as URLRequest) {
//                        (data, response, error) -> Void in
//                        if let unwrappedData = data {
//
//                            do {
//
//                                // Convert the Json object to an array of dictionaries
//                                let tokenDictionary:NSDictionary = try JSONSerialization.jsonObject(with: unwrappedData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
//
//                                // Get the token
//                                let token:String = tokenDictionary["access_token"] as! String
//
//                                // Keep record of the token
//                                let _:Bool = KeychainWrapper.standard.set(token, forKey: "access_token")
//
//                                // Dismiss login view and go to the home view controller
//                                self.dismiss(animated: true, completion: nil)
//
//                            }
//                            catch {
//                                // Wrong credentials
//                                // Reset the text fields
//                                self.nameTextField.text = ""
//                                self.pswTextField.text = ""
//
//                                // Setup the alert
//                                let alertView = UIAlertController(title: "Login failed",
//                                                                  message: "Wrong username or password." as String, preferredStyle:.alert)
//                                let okAction = UIAlertAction(title: "Try Again!", style: .default, handler: nil)
//                                alertView.addAction(okAction)
//                                self.present(alertView, animated: true, completion: nil)
//                                return
//                            }
//                        }
//                    }
//                    task.resume()
//                }
//            }
//
//
    
    }
    





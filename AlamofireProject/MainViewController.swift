//
//  ViewController.swift
//  AlamofireProject
//
//  Created by MacBook Pro on 21/03/2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
import Alamofire
import p2_OAuth2
class MainViewController : UIViewController {
    @IBOutlet var tokenLabel: UILabel!
    var texte:String?
     var loginServices: BaseService?
    @IBOutlet var nameUniteTextField: UITextField!
    
    
    @IBOutlet var idUniteTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  guard  let texte as! String? else { return}
  tokenLabel.text = texte

      print("Token ViewCont ViewDidAppear = \(UserDefaults.standard.string(forKey: "Token"))")
        

         
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if (isLoggedIn()) {
            print("c'est deja connecte")
         
            
        }
            
        
    }

    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }

    func deleteRequest(byId Id: Int, completion: @escaping (Bool) -> Void) {
        let urlString = "https://clocation.azurewebsites.net/api/EnumUnite/\(Id)"
        AF.request(urlString, method: .delete).responseString { response in
            completion(response.result.isSuccess)
            //print(response.result.isSuccess)
        }
    }
    
    @IBAction func clickButton(_ sender: Any) {
        print("Token ViewCont PressedButton = \( AppManager.shared.token)")

//             let value = idUniteTextField.text!
//                let rewardInt = Int(value)
//            deleteRequest(byId: rewardInt! ) { (tweetRequest) in
//            print(tweetRequest)

        
        
    }
  
    @IBAction func logoutButton(_ sender: Any) {
       
            loginServices?.oauth2.forgetTokens()
      
        loginServices?.oauth2.username    = nil
        loginServices?.oauth2.password    = nil
      
    
        print(  loginServices?.oauth2.accessToken ?? "")
        let storage = HTTPCookieStorage.shared
        storage.cookies?.forEach() {
            storage.deleteCookie($0)
            print(storage)
        }
        print("logout ")
        UserDefaults.standard.set("", forKey: "Token")
        UserDefaults.standard.setIsLoggedIn(value: false)
        
//        let loginController = LoginViewController()
//        self.present(loginController, animated: true, completion: nil)
    }
    
    
    /************** Get / id ***************/
    //     let value = idUniteTextField.text!
    //        let rewardInt = Int(value)
    //        getUniteRequest(byId: rewardInt! ) { (tweetRequest) in
    //            print(tweetRequest!)
//    func getUniteRequest(byId Id: Int, completion: @escaping (Unite?) -> Void) {
//        let urlString = "https://clocation.azurewebsites.net/api/EnumUnite/\(Id)"
//        AF.request(urlString).response { response in
//            guard let data = response.data else { return }
//            do {
//                let decoder = JSONDecoder()
//                let Request = try decoder.decode(Unite.self, from: data)
//                print(Request)
//                print(Request.id!)
//            } catch let error {
//                print(error)
//                completion(nil)
//            }
//        }
//    }
    
    
   /************** Post ***************/
//        let urlString = "https://clocation.azurewebsites.net/api/EnumUnite"
//
//        AF.request(urlString, method: .post, parameters: ["name": nameUniteTextField.text!],encoding: JSONEncoding.default, headers: nil).responseJSON {
//            response in
//
//    switch response.result {
//    case .success:
//    print(response)
//
//    break
//    case .failure(let error):
//
//    print(error)
//    }
//        }
//
    

}


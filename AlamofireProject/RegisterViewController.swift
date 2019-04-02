//
//  RegisterViewController.swift
//  AlamofireProject
//
//  Created by MacBook Pro on 27/03/2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
var RegisterService: BaseServiceRegister?
    @IBOutlet var cityText: UITextField!
    @IBOutlet var tuEsTextField: UITextField!
    @IBOutlet var sitesocieteTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var socnameText: UITextField!
    @IBOutlet var addrText: UITextField!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var numTelText: UITextField!
    @IBOutlet var emailText: UITextField!
    
    @IBOutlet var passText: UITextField!
    var list = ["Societe" , "Particulier"]
   
    @IBOutlet var descrptionLabel: UILabel!
    @IBOutlet var siteLabel: UILabel!
    @IBOutlet var namesocLabel: UILabel!
    override func viewDidLoad() {
      
        super.viewDidLoad()

        self.pickerView.isHidden = true


    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return list.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return list[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.tuEsTextField.text = self.list[row]
        self.pickerView.isHidden = true
        if  (  self.tuEsTextField.text  == "Particulier"  && self.list[row] == "Particulier" ) {
            self.pickerView.isHidden = true
            self.socnameText.isHidden = true
            
            self.descrptionLabel.isHidden = true
            self.namesocLabel.isHidden = true
            self.siteLabel.isHidden = true
            self.descriptionTextField.isHidden = true
            self.sitesocieteTextField.isHidden = true
        }
        else if (self.tuEsTextField.text == "Societe" && self.list[row] == "Societe"  )  {
            self.pickerView.isHidden = true
            self.descrptionLabel.isHidden = false
            self.namesocLabel.isHidden = false
            self.siteLabel.isHidden = false
            self.socnameText.isHidden = false
            self.descriptionTextField.isHidden = false
            self.sitesocieteTextField.isHidden = false
            
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.tuEsTextField {
            self.pickerView.isHidden = false
            //if you dont want the users to se the keyboard type:
            
            textField.endEditing(true)
        }
    }
    
    
    
    @IBAction func RegisterButton(_ sender: Any) {
        
        let value = numTelText.text!
        let rewardInt = Int(value)
        
        var params :[String: AnyObject]?
       if (self.tuEsTextField.text == "Particulier" ) {
        params = (["email" : emailText.text!, "password" : passText.text! , "phoneNumber" : rewardInt! , "isPartner" : false , "partnerAddress" :addrText.text!, "partnerCity" : cityText.text! ] as [String : AnyObject])
        
        var urlRequest = URLRequest(url: URL(string: "http://clocation.azurewebsites.net/api/users")!)
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Accept")
        
        let urlString = urlRequest.url?.absoluteString
        
        AF.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            
            print(response.result.value as Any)
        }
       } else {
        params = ["email" : emailText.text!, "password" : passText.text! , "phoneNumber" : rewardInt! , "isPartner" : true , "partnerAddress" :addrText.text!, "partnerCity" : cityText.text! , "partnerDescription" :descriptionTextField.text!, "partnerName" : socnameText.text! , "partnerWebSite" :sitesocieteTextField.text! ] as [String : AnyObject]
        
        var urlRequest = URLRequest(url: URL(string: "http://clocation.azurewebsites.net/api/users")!)
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Accept")
        
        let urlString = urlRequest.url?.absoluteString
        
        AF.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            
            print(response.result.value as Any)
        }
        }
        
//        if (self.tuEsTextField.text == "Particulier" ) {
//
//            registerParticulier(email: emailText.text!, Pass: passText.text!, phoneNumber: rewardInt!, isPartner: false, partnerAddress: addrText.text!, partnerCity: cityText.text!)
//        }
//        else if (self.tuEsTextField.text == "Societe" )  {
//
//             registerSociete(email: emailText.text!, Pass: passText.text!, phoneNumber: rewardInt!, isPartner: true, partnerAddress: addrText.text!, partnerCity: cityText.text! , partnerDescription : descriptionTextField.text!, partnerName : socnameText.text! , partnerWebSite : sitesocieteTextField.text!)
//        }
//
        
        
    }
 
    func registerSociete(email : String , Pass : String , phoneNumber : Int , isPartner : Bool  ,partnerAddress : String, partnerCity : String, partnerDescription : String, partnerName : String , partnerWebSite : String) {
        
        
        var params :[String: AnyObject]?
        params = ["email" : email, "password" : Pass , "phoneNumber" : phoneNumber , isPartner : true , "partnerAddress" :partnerAddress, "partnerCity" : partnerCity , "partnerDescription" :partnerDescription, "partnerName" : partnerName , "partnerWebSite" :partnerWebSite ] as? [String : AnyObject]
        
        var urlRequest = URLRequest(url: URL(string: "http://clocation.azurewebsites.net/api/users")!)
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Accept")
        
        let urlString = urlRequest.url?.absoluteString
        
        AF.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            
            print(response.result.value as Any)
        }
    }
        
    
    func registerParticulier ( email : String , Pass : String , phoneNumber : Int , isPartner : Bool  ,partnerAddress : String, partnerCity : String){
     
        
        var params :[String: AnyObject]?
       params = (["email" : email, "password" : Pass , "phoneNumber" : phoneNumber , isPartner : true , "partnerAddress" :partnerAddress, "partnerCity" : partnerCity ] as! [String : AnyObject])
        
        var urlRequest = URLRequest(url: URL(string: "http://clocation.azurewebsites.net/api/users")!)
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json",
                            forHTTPHeaderField: "Accept")
        
        let urlString = urlRequest.url?.absoluteString
        
        AF.request(urlString!, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            
            print(response.result.value as Any)
        }
    }
 

}

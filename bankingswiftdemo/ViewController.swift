//
//  ViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 6.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly
class ViewController: UIViewController {

   
    
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var customerID: UITextField!
    @IBOutlet weak var applicationsButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true;
        view.backgroundColor =  UIColor.white
        applicationsButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
       
       
        contactButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        Countly.sharedInstance().startEvent("LoginOperation")
        Countly.sharedInstance().recordView("LoginView")
        self.view.makeToast("Login view tracked", duration: 4.0, position: .bottom)

   
    }
    


    @objc func didButtonClick(_ sender: UIButton) {

      
        if(sender === applicationsButton){
            Countly.sharedInstance().recordView("ApplicationsView")
            if let url = URL(string: "https://demo.count.ly/at/9963384634a5b8e0feb0ea6ef1652f82fa56b9c4"), UIApplication.shared.canOpenURL(url) {
               if #available(iOS 10.0, *) {
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
               } else {
                  UIApplication.shared.openURL(url)
               }
            }
        }else if(sender === signInButton){
          
            //signInButtonClicked();
            DispatchQueue.main.async{
                                              self.performSegue(withIdentifier: "toMainView", sender: nil)
                                          }
            
               }else if(sender === contactButton){
            let contact_type  = Countly.sharedInstance().remoteConfigValue(forKey:"contact_type");
            if(contact_type as! Int == 0){
                let alert = UIAlertController(title: "Do you want to call the customer services ?", message: "Click yes, if you want to talk with customer services.", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                       let urlSchema = "tel:"
                                 let numberToCall = "123123123123"
                                if let url = URL(string: "\(urlSchema)\(numberToCall)"), UIApplication.shared.canOpenURL(url) {
                                            if #available(iOS 10.0, *) {
                                               UIApplication.shared.open(url, options: [:], completionHandler: nil)
                                            } else {
                                               UIApplication.shared.openURL(url)
                                            }
                                         }
                }))
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                self.present(alert, animated: true)
             
            }else{
                performSegue(withIdentifier: "toContactView", sender: nil)
            }
        }
        
    }
    

    
    private func signInButtonClicked(){
        
        if(customerID.text?.trim() == "" || password.text?.trim() == "" ){
            DispatchQueue.main.async {
                self.wrongLoginData()
            }
        }else{
            // Prepare URL
                   let url = URL(string: "https://api.banking-demo.tools.count.ly/user/login")
                   guard let requestUrl = url else { fatalError() }
                   // Prepare URL Request Object
                   var request = URLRequest(url: requestUrl)
                   request.httpMethod = "POST"
                    
                   // HTTP Request Parameters which will be sent in HTTP Request Body
                   let postString = "customerID=" + (customerID.text)! + "&password=" + (password.text)!;
                   // Set HTTP Request Body
                   request.httpBody = postString.data(using: String.Encoding.utf8);
                   // Perform HTTP Request
                   let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                           
                           // Check for Error
                           if let error = error {
                               print("Error took place \(error)")
                               return
                           }
                    
                           // Convert HTTP Response Data to a String
                           if let data = data, let dataString = String(data: data, encoding: .utf8) {
                               let dict = dataString.toJSON() as? [String:AnyObject]
                               if(dict == nil){
                                Countly.user().increment("WrongLoginCount")
                                Countly.user().save()

                                   DispatchQueue.main.async {
                                   self.wrongLoginData()
                                   }
                               }else{
                              

                                Countly.sharedInstance().endEvent("LoginOperation")
                                Countly.user().name = (dict!["name"]! as! String) as CountlyUserDetailsNullableString;
                                Countly.user().username = (dict!["email"]! as! String) as CountlyUserDetailsNullableString
                                     Countly.user().email = (dict!["email"]! as! String) as CountlyUserDetailsNullableString
                                Countly.user().birthYear = (dict!["byear"]! as! NSNumber ) as CountlyUserDetailsNullableNumber
                                     Countly.user().gender = (dict!["gender"]! as! String) as CountlyUserDetailsNullableString
                                     Countly.user().phone = (dict!["phone"]! as! String) as CountlyUserDetailsNullableString
                                Countly.sharedInstance().setNewDeviceID(("\(dict!["customerID"]!)"), onServer:true)
                                     Countly.user().pictureURL = (dict!["picture"]! as! String) as CountlyUserDetailsNullableString
                                
                                Countly.user().increment("SuccessfulLoginCount")


                                        
                                         Countly.user().custom = [
                                            "QR":dict!["QR"]!,
                                            "QRCashWithdrawSuccess":dict!["wrCashWithdrawSuccess"]!,
                                    "QRCashWithdrawUnsuccessful":dict!["wrCashWithdrawUnsuccessful"]!,
                                            "QRCashWithdrawAttempt":dict!["wrCashWithdrawAttempt"]!,
                                            "Has Loan":dict!["hasLoan"]!,
                                            "Has Investment":dict!["hasInvestment"]!,
                                            "Has Credit Card":dict!["hasCreditCard"]!,
                                            "Has Active Internet Banking":dict!["hasActiveInternetBanking"]!
                                            ] as CountlyUserDetailsNullableDictionary
                               
                           

                                     Countly.user().save()

                                DispatchQueue.main.async{
                                   self.performSegue(withIdentifier: "toMainView", sender: nil)
                               }
                            }
                           }
                   }
                   task.resume()
            
        }
        
    

    }
    
    
    private func wrongLoginData(){
        let alert = UIAlertController(title: "Incorrect customerID !", message: "Please check your customer ID", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        let myException : NSException = NSException.init(name:NSExceptionName(rawValue: "MyException"), reason:"MyReason", userInfo:["key":"value"])

               Countly.sharedInstance().recordHandledException(myException)
        Countly.sharedInstance().updateRemoteConfig
        { (error : Error?) in
            if (error == nil)
            {
                print("Remote Config is updated and ready to use!")
            }
            else
            {
                print("There was an error while fetching Remote Config:\n\(error!.localizedDescription)")
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
   

}


extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

extension String
{
    func trim() -> String
   {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
   }
}

extension UIButton {
open override var isHighlighted: Bool {
    didSet {
        super.isHighlighted = false
    }
}}

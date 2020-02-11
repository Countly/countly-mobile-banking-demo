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

   
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var customerID: UITextField!
    @IBOutlet weak var atmButton: UIButton!
    @IBOutlet weak var applicationsButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true;
        view.backgroundColor =  UIColor.white
        applicationsButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        atmButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        Countly.sharedInstance().startEvent("LoginOperation")
        Countly.sharedInstance().recordView("LoginView")
    }

    @objc func didButtonClick(_ sender: UIButton) {
        if(sender === applicationsButton){
            Countly.sharedInstance().recordView("ApplicationsView")
            if let url = URL(string: "https://ickarakurt.gitlab.io/countly-banking-demo/"), UIApplication.shared.canOpenURL(url) {
               if #available(iOS 10.0, *) {
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
               } else {
                  UIApplication.shared.openURL(url)
               }
            }
        }else if(sender === signInButton){
                if customerID.text == "demo" {
                    if password.text == "demo" {
                        Countly.sharedInstance().endEvent("LoginOperation")
                        performSegue(withIdentifier: "toMainView", sender: nil)
                    }else{
                        let dict : Dictionary<String, String> = ["customerID": customerID.text ?? ""]
                        Countly.sharedInstance().recordEvent("wrongPassword", segmentation:dict)
                        let alert = UIAlertController(title: "Incorrect password !", message: "Please check your password", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
                        self.present(alert, animated: true)
                    }
                }else{
                    let dict : Dictionary<String, String> = ["customerID": customerID.text ?? ""]
                    Countly.sharedInstance().recordEvent("wrongCustomerID", segmentation:dict)
                    let alert = UIAlertController(title: "Incorrect customerID !", message: "Please check your customer ID", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true)

                }
               }else if(sender === atmButton){
                Countly.sharedInstance().recordView("ATMView")
               if let url = URL(string: "https://ickarakurt.gitlab.io/atm/"), UIApplication.shared.canOpenURL(url) {
                  if #available(iOS 10.0, *) {
                     UIApplication.shared.open(url, options: [:], completionHandler: nil)
                  } else {
                     UIApplication.shared.openURL(url)
                  }
               }
           
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
   
}


//
//  ViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 6.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var applicationsButton: UIButton!
    @IBOutlet weak var atmButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     //   signInButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        navigationItem.hidesBackButton = true;
        view.backgroundColor =  UIColor.white
        applicationsButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)

    }

    @objc func didButtonClick(_ sender: UIButton) {
        if(sender === applicationsButton){
            if let url = URL(string: "https://ickarakurt.gitlab.io/countly-banking-demo/"), UIApplication.shared.canOpenURL(url) {
               if #available(iOS 10.0, *) {
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
               } else {
                  UIApplication.shared.openURL(url)
               }
            }
        }else if(sender === signInButton){
            performSegue(withIdentifier: "toMainView", sender: nil)
        }else if(sender === atmButton){
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


//
//  CreditCardApplicationViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 12.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class CreditCardApplicationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Credit Card Application"
        self.view.makeToast("Credit card application view tracked", duration: 4.0, position: .bottom)
        Countly.sharedInstance().recordView("CreditCardApplicationView")
    }
    
    @IBAction func apply(_ sender: Any) {
        let dict : Dictionary<String, String> = ["type": "Credit Card"]
                      Countly.sharedInstance().recordEvent("Application", segmentation:dict)
                       let alert = UIAlertController(title: "Applied", message: "", preferredStyle: .alert)

                   alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { action in
                       self.navigationController?.popViewController(animated: true)
                   }))

                       self.present(alert, animated: true)
    }
   
    
    
    
}

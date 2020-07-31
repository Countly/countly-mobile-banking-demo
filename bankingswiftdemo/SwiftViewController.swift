//
//  SwiftViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 11.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class SwiftViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var iban: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Swift"
        Countly.sharedInstance().recordView("SwiftView")
    }
    
    
     
    @IBAction func send(_ sender: Any) {
        let dict : Dictionary<String, String> = ["type": "Swift"]
                           Countly.sharedInstance().recordEvent("Transfer", segmentation:dict)
                            let alert = UIAlertController(title: "Money Sent", message: "", preferredStyle: .alert)

                        alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { action in
                            self.navigationController?.popViewController(animated: true)
                        }))

                            self.present(alert, animated: true)
    }
    
    
    
    
}

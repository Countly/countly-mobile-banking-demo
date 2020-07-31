    //
    //  ToAnotherBankViewController.swift
    //  bankingswiftdemo
    //
    //  Created by Cem Karakurt on 11.02.2020.
    //  Copyright © 2020 Cem Karakurt. All rights reserved.
    //

    import UIKit
    import Countly

    class ToAnotherBankViewController: UIViewController {

        
        @IBOutlet weak var amount: UITextField!
        @IBOutlet weak var iban: UITextField!
        @IBOutlet weak var name: UITextField!
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationItem.title = "To Another Bank"
            Countly.sharedInstance().recordView("ToAnotherBankView")
        }
        
        
         
        
        
        @IBAction func send(_ sender: Any) {
            let dict : Dictionary<String, String> = ["type": "ToAnotherBank"]
                        Countly.sharedInstance().recordEvent("Transfer", segmentation:dict)
                         let alert = UIAlertController(title: "Money Sent", message: "", preferredStyle: .alert)

                     alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { action in
                         self.navigationController?.popViewController(animated: true)
                     }))

                         self.present(alert, animated: true)
        }
        
        
        
    }

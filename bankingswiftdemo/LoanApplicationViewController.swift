//
//  LoanApplicationViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 12.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class LoanApplicationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Loan Application"
        Countly.sharedInstance().recordView("LoanApplicationView")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func apply(_ sender: Any) {
        let dict : Dictionary<String, String> = ["type": "Loan"]
           Countly.sharedInstance().recordEvent("Application", segmentation:dict)
            let alert = UIAlertController(title: "Applied", message: "", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { action in
            self.navigationController?.popViewController(animated: true)
        }))

            self.present(alert, animated: true)
    }
    
    
    }


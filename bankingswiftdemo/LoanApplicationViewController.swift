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
        Countly.sharedInstance().recordView("LoanApplicationView")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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


//
//  InvestmentsViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 10.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import iOSDropDown
import Countly

class InvestmentsViewController: UIViewController {


    @IBOutlet weak var organizationType: DropDown!
    
    var selectedOption : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Investments"
        Countly.sharedInstance().recordView("InvestmentsView")
        self.view.makeToast("Investments view tracked", duration: 4.0, position: .bottom)
        organizationType.optionArray = ["Organization X", "Organization Y", "Organization Z"]
        // The the Closure returns Selected Index and String
        organizationType.didSelect{(selectedText , index ,id) in
        // Do any additional setup after loading the view.
            self.selectedOption = selectedText
        }

    }
    
    @IBAction func invest(_ sender: Any) {
        let dict : Dictionary<String, String> = ["organization": selectedOption]
                                             Countly.sharedInstance().recordEvent("Investment", segmentation:dict)
                                              let alert = UIAlertController(title: "Paid", message: "", preferredStyle: .alert)

                                          alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { action in
                                              self.navigationController?.popViewController(animated: true)
                                          }))

                                              self.present(alert, animated: true)
    }
    
    
}

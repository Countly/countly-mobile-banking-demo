//
//  GasViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 10.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import iOSDropDown
import Countly

class GasViewController: UIViewController {


    @IBOutlet weak var companyType: DropDown!
    var selectedOption : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        Countly.sharedInstance().recordView("GasView")
        companyType.optionArray = ["Company X", "Company Y", "Company Z"]
        // The the Closure returns Selected Index and String
        companyType.didSelect{(selectedText , index ,id) in
         // Do any additional setup after loading the view.
             self.selectedOption = selectedText
         }        // Do any additional setup after loading the view.
    }
    


    
    @IBAction func pay(_ sender: Any) {
        let dict : Dictionary<String, String> = ["type": "Gas","company": selectedOption]
                                      Countly.sharedInstance().recordEvent("Util", segmentation:dict)
                                       let alert = UIAlertController(title: "Paid", message: "", preferredStyle: .alert)

                                   alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { action in
                                       self.navigationController?.popViewController(animated: true)
                                   }))

                                       self.present(alert, animated: true)
    }
    
    
    
    
}


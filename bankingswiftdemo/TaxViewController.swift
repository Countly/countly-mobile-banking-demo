//
//  TaxViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 10.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import iOSDropDown
import Countly

class TaxViewController: UIViewController {

    @IBOutlet weak var taxType: DropDown!
    
    var selectedOption : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Tax Payment"
        taxType.optionArray = ["Type X", "Type Y", "Type Z"]
        // The the Closure returns Selected Index and String
        taxType.didSelect{(selectedText , index ,id) in
        // Do any additional setup after loading the view.
            self.selectedOption = selectedText
        }
        self.view.makeToast("Tax payment view tracked", duration: 4.0, position: .bottom)
        Countly.sharedInstance().recordView("TaxView")
    }
    

    @IBAction func pay(_ sender: Any) {
        let dict : Dictionary<String, String> = ["type": "Tax","taxType": selectedOption]
                               Countly.sharedInstance().recordEvent("Payment", segmentation:dict)
                                let alert = UIAlertController(title: "Paid", message: "", preferredStyle: .alert)

                            alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { action in
                                self.navigationController?.popViewController(animated: true)
                            }))

                                self.present(alert, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


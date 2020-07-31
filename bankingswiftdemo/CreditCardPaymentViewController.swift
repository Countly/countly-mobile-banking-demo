//
//  CreditCardPaymentViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 10.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import iOSDropDown
import Countly

class CreditCardPaymentViewController: UIViewController {


    @IBOutlet weak var cardType: DropDown!
    var selectedOption : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Credit Card Payment"
        cardType.optionArray = ["Card X", "Card Y", "Card Z"]
        // The the Closure returns Selected Index and String
         cardType.didSelect{(selectedText , index ,id) in
             // Do any additional setup after loading the view.
                 self.selectedOption = selectedText
        }
        Countly.sharedInstance().recordView("CreditCardPaymentView")

    }
    

    @IBAction func pay(_ sender: Any) {
        let dict : Dictionary<String, String> = ["type": "Credit Card","card": selectedOption]
        Countly.sharedInstance().recordEvent("Payment", segmentation:dict)
                                       let alert = UIAlertController(title: "Paid", message: "", preferredStyle: .alert)

                                   alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { action in
                                       self.navigationController?.popViewController(animated: true)
                                   }))

                                       self.present(alert, animated: true)
    }
}

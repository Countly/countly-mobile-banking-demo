//
//  PersonalFinanceLoanCalculationViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 11.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly
class PersonalFinanceLoanCalculationViewController: UIViewController {

    @IBOutlet weak var answer: UILabel!
    
    @IBOutlet weak var term: UITextField!
    @IBOutlet weak var amount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Calculation"
        Countly.sharedInstance().recordView("PersonalFinanceLoanCalculationView")
    }
    
    
    
  
    
    @IBAction func calculate(_ sender: Any) {
        print("clicked")
        if let amount = self.amount.text,  let amountInt = Int(amount) {
            if let term = self.term.text,  let termInt = Int(term) {
                    answer.text = String( amountInt / termInt )

                let dict : Dictionary<String, String> = ["amount": self.amount.text ?? "", "term": self.term.text ?? ""]
                    Countly.sharedInstance().recordEvent("PersonalFinanceLoanCalculation", segmentation:dict)
                  }
           }
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

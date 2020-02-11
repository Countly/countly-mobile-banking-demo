//
//  DepositReturnCalculationViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 11.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class DepositReturnCalculationViewController: UIViewController {

    
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var term: UITextField!
    @IBOutlet weak var rate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    Countly.sharedInstance().recordView("DepositReturnCalculationView")
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let amount = self.amount.text,  let amountDouble = Double(amount) {
                if let term = self.term.text,  let termDouble = Double(term) {
                    if let rate = self.rate.text,  let rateDouble = Double(rate) {
                        answer.text = String(Int(amountDouble + (amountDouble*rateDouble / 100)))
                        let dict : Dictionary<String, String> = ["amount": self.amount.text ?? "", "term": self.term.text ?? "", "rate": self.rate.text ?? ""]
                        Countly.sharedInstance().recordEvent("DepositReturnCalculation", segmentation:dict)
                    }
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

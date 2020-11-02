//
//  DepositRatesViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 11.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class DepositRatesViewController: UIViewController {


    @IBOutlet weak var month1rate: UILabel!
    @IBOutlet weak var month12rate: UILabel!
    @IBOutlet weak var month3rate: UILabel!
    @IBOutlet weak var month6rate: UILabel!
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.navigationItem.title = "Rates"
        Countly.sharedInstance().updateRemoteConfig
        { (error : Error?) in
            if (error == nil)
            {
                 let month1rate : Any? = Countly.sharedInstance().remoteConfigValue(forKey:"month1rate")
               self.month1rate.text = String(describing: (month1rate ?? "")) + " Interest Rate"
               
               
               let month3rate : Any? = Countly.sharedInstance().remoteConfigValue(forKey:"month3rate")
               self.month3rate.text = String(describing: (month3rate ?? "")) + " Interest Rate"
               
               let month6rate : Any? = Countly.sharedInstance().remoteConfigValue(forKey:"month6rate")
               self.month6rate.text = String(describing: (month6rate ?? "")) + " Interest Rate"
               
               let month12rate : Any? = Countly.sharedInstance().remoteConfigValue(forKey:"month12rate")
               self.month12rate.text = String(describing: (month12rate ?? ""))  + " Interest Rate"
                       
            }
            else
            {
                print("There was an error while fetching Remote Config:\n\(error!.localizedDescription)")
            }
        }
       
        self.view.makeToast("Deposit rates view tracked", duration: 4.0, position: .bottom)

        Countly.sharedInstance().recordView("DepositRatesView")

    }
    

    

}

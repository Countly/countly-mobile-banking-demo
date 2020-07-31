//
//  CalculationViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 6.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class CalculationViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Calculation"
        Countly.sharedInstance().recordView("CalculationView");
    }
    
    
    
    


}

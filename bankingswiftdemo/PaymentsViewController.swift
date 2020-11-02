//
//  PaymentsViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 6.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Payments"
        self.view.makeToast("Payments view tracked", duration: 4.0, position: .bottom)

    }
    



}

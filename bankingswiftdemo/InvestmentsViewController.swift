//
//  InvestmentsViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 10.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import iOSDropDown

class InvestmentsViewController: UIViewController {


  
    @IBOutlet weak var organizationType: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        organizationType.optionArray = ["Organization X", "Organization Y", "Organization Z"]
        // The the Closure returns Selected Index and String
        organizationType.didSelect{(selectedText , index ,id) in
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

}
}

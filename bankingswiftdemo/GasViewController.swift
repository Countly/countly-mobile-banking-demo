//
//  GasViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 10.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import iOSDropDown

class GasViewController: UIViewController {


    @IBOutlet weak var companyType: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyType.optionArray = ["Company X", "Company Y", "Company Z"]
        // The the Closure returns Selected Index and String
        companyType.didSelect{(selectedText , index ,id) in
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

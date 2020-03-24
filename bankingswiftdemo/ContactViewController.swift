//
//  ContactViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 11.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class ContactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Countly.sharedInstance().recordView("ContactView")
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
    @IBAction func contactSend(_ sender: Any) {
        Countly.sharedInstance().recordEvent("ContactFormSent")
        
        
            let alert = UIAlertController(title: "Sent", message: "", preferredStyle: .alert)

                 alert.addAction(UIAlertAction(title: "Go Back", style: .default, handler: { action in
                     self.navigationController?.popViewController(animated: true)
                 }))

                     self.present(alert, animated: true)
        
        
        
    }
    
}

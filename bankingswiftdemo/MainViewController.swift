//
//  MainViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 6.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class MainViewController: UIViewController {

    @IBOutlet weak var mainPageText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true;
        Countly.sharedInstance().recordView("MainView")
        
        Countly.sharedInstance().updateRemoteConfig
            { (error : Error?) in
                if (error == nil)
                {
                     let mainPageText : Any? = Countly.sharedInstance().remoteConfigValue(forKey:"mainPageMessage")
                   self.mainPageText.text = String(describing: (mainPageText ?? ""))
                   
            
                }
                else
                {
                    print("There was an error while fetching Remote Config:\n\(error!.localizedDescription)")
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

    
    override func viewWillAppear(_ animated: Bool) {
        Countly.sharedInstance().updateRemoteConfig
            { (error : Error?) in
                if (error == nil)
                {
                     let mainPageText : Any? = Countly.sharedInstance().remoteConfigValue(forKey:"mainPageMessage")
                   self.mainPageText.text = String(describing: (mainPageText ?? ""))
                   
            
                }
                else
                {
                    print("There was an error while fetching Remote Config:\n\(error!.localizedDescription)")
                }
            }
        
    }
    
}

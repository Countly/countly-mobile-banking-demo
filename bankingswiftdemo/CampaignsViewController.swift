//
//  CampaignsViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 24.03.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class CampaignsViewController: UIViewController {

    
  
    @IBOutlet weak var discountImage: UIImageView!
    @IBOutlet weak var discountTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.makeToast("Campaigns view tracked", duration: 4.0, position: .bottom)
       self.navigationItem.title = "Campaigns"

    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        Countly.sharedInstance().updateRemoteConfigOnly(forKeys:["campaign_type"])
        { (error : Error?) in
            if (error == nil)
            {
                 let campaign_type  = Countly.sharedInstance().remoteConfigValue(forKey:"campaign_type");
                         if(campaign_type as! Int == 0){
                            self.discountTitle.text = "Campaign for Individual Customers"
                         }else{
                            self.discountTitle.text = "Campaign for Commercial Customers"
                          }
            }
            else
            {
                print("There was an error while fetching Remote Config:\n\(error!.localizedDescription)")
            }
        }
   
    }

}

//
//  ConsentsViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 23.03.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly

class ConsentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"
        Countly.sharedInstance().recordView("SettingsView")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func behaviourChange(_ sender: UISwitch) {
        if(sender.isOn){
                               
            Countly.sharedInstance().giveConsent(forFeatures: [CLYConsentSessions, CLYConsentUserDetails, CLYConsentViewTracking, CLYConsentEvents,CLYConsentCrashReporting])

            }else{
                 Countly.sharedInstance().cancelConsent(forFeatures: [CLYConsentSessions, CLYConsentUserDetails, CLYConsentViewTracking, CLYConsentEvents,CLYConsentCrashReporting])
            }
                      
    }
    
    @IBAction func engagementChange(_ sender: UISwitch) {
        if(sender.isOn){
                           
        Countly.sharedInstance().giveConsent(forFeatures: [CLYConsentPushNotifications,CLYConsentAttribution])

        }else{
             Countly.sharedInstance().cancelConsent(forFeatures: [CLYConsentPushNotifications,CLYConsentAttribution])
        }
             
    }
    
    
    @IBAction func contextChange(_ sender: UISwitch) {
        if(sender.isOn){
            Countly.sharedInstance().giveConsent(forFeatures: [CLYConsentLocation])
       }else{
            Countly.sharedInstance().cancelConsent(forFeatures: [CLYConsentLocation])
       }
    }
    
    
    @IBAction func voiceOfCustomerChange(_ sender: UISwitch) {
        if(sender.isOn){
                  Countly.sharedInstance().giveConsent(forFeatures: [CLYConsentStarRating])
             }else{
                  Countly.sharedInstance().cancelConsent(forFeatures: [CLYConsentStarRating])
             }
    }
    
    
}

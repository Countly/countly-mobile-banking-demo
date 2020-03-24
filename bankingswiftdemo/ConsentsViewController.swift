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
        Countly.sharedInstance().recordView("SettingsView")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func sessionsSwitchChanged(_ sender: UISwitch) {
        if(sender.isOn){
            Countly.sharedInstance().giveConsent(forFeature: CLYConsentSessions)
        }else{
            Countly.sharedInstance().cancelConsent(forFeature:  CLYConsentSessions)
        }

    }
    @IBAction func eventsSwitchChanged(_ sender: UISwitch) {
        if(sender.isOn){
                  Countly.sharedInstance().giveConsent(forFeature: CLYConsentEvents)
              }else{
                  Countly.sharedInstance().cancelConsent(forFeature:  CLYConsentEvents)
              }
        
    }
    @IBAction func usersSwitchChanged(_ sender: UISwitch) {
        if(sender.isOn){
                         Countly.sharedInstance().giveConsent(forFeature: CLYConsentUserDetails)
                     }else{
                         Countly.sharedInstance().cancelConsent(forFeature:  CLYConsentUserDetails)
                     }
               
    }
    @IBAction func crashesSwitchChanged(_ sender: UISwitch) {
        if(sender.isOn){
                         Countly.sharedInstance().giveConsent(forFeature: CLYConsentCrashReporting)
                     }else{
                         Countly.sharedInstance().cancelConsent(forFeature:  CLYConsentCrashReporting)
                     }
               
    }
    @IBAction func pushSwitchChanged(_ sender: UISwitch) {
        if(sender.isOn){
                         Countly.sharedInstance().giveConsent(forFeature: CLYConsentPushNotifications)
                     }else{
                         Countly.sharedInstance().cancelConsent(forFeature:  CLYConsentPushNotifications)
                     }
               
    }
    @IBAction func locationSwitchChanged(_ sender: UISwitch) {
        if(sender.isOn){
                         Countly.sharedInstance().giveConsent(forFeature: CLYConsentLocation)
                     }else{
                         Countly.sharedInstance().cancelConsent(forFeature:  CLYConsentLocation)
                     }
               
    }
    @IBAction func viewSwitchChanged(_ sender: UISwitch) {
         if(sender.isOn){
                         Countly.sharedInstance().giveConsent(forFeature: CLYConsentViewTracking)
                     }else{
                         Countly.sharedInstance().cancelConsent(forFeature:  CLYConsentViewTracking)
                     }


    }
    
    @IBAction func attributionSwitchChanged(_ sender: UISwitch) {
        if(sender.isOn){
                         Countly.sharedInstance().giveConsent(forFeature: CLYConsentAttribution)
                     }else{
                         Countly.sharedInstance().cancelConsent(forFeature:  CLYConsentAttribution)
                     }
               
    }
    
    @IBAction func starRatingSwitchChanged(_ sender: UISwitch) {
        if(sender.isOn){
                         Countly.sharedInstance().giveConsent(forFeature: CLYConsentStarRating)
                     }else{
                         Countly.sharedInstance().cancelConsent(forFeature:  CLYConsentStarRating)
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

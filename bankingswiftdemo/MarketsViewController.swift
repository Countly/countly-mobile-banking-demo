//
//  MarketsViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 11.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit
import Countly
class MarketsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Markets"
        self.view.makeToast("Markets payment view tracked", duration: 4.0, position: .bottom)

    Countly.sharedInstance().recordView("MarketsView")

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

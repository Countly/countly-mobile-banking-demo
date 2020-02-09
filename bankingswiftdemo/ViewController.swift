//
//  ViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 6.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   

    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     //   signInButton.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        navigationItem.hidesBackButton = true;
        view.backgroundColor =  UIColor.white

    }

    @objc func didButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainView", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
   
}


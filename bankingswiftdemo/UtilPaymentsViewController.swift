//
//  UtilPaymentsViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 6.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit

class UtilPaymentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = UIView()

    }
    
    
    var links: [String] = ["Electric","Gas","Water"]
    var identifiers: [String] = ["toElectricView","toGasView","toWaterView"]


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = links[indexPath.row]
        return cell
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let identifier : String = identifiers[indexPath.row];
           performSegue(withIdentifier: identifier, sender: nil)

    }
    
    


}

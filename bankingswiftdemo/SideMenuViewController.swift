//
//  SideMenuViewController.swift
//  bankingswiftdemo
//
//  Created by Cem Karakurt on 6.02.2020.
//  Copyright © 2020 Cem Karakurt. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = UIView()
    }
    
    
    var links: [String] = ["Home","Transfers","Payments","Products","Investments","Applications","Logout"]
    var identifiers: [String] = ["toHomeView","toTransfersView","toPaymentsView","toProductsView","toInvestmentsView","toApplicationsView","toLogoutView"]


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.97, alpha: 1.00)
        cell.textLabel?.textColor = UIColor(red: 0.27, green: 0.29, blue: 0.31, alpha: 1.00)
        cell.textLabel?.font = UIFont(name:"Inter", size:20)
        cell.textLabel?.text = links[indexPath.row]
        return cell
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let identifier : String = identifiers[indexPath.row];
           performSegue(withIdentifier: identifier, sender: nil)

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

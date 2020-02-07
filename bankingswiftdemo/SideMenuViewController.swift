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
        tableView.tableFooterView = UIView()  // it's just 1 line, awesome!
    }
    
    
    var links: [String] = ["Home","Transfers","Payments","Products","Investments","Applications","Logout"]
    var identifiers: [String] = ["toHomeView","toTransfersView","toPaymentsView","toProductsView","toInvestmentsView","toApplicationsView","toLogoutView"]


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(red:0.04, green:0.07, blue:0.10, alpha:1.0)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.text = links[indexPath.row]
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = UIColor(red:0.18, green:0.65, blue:0.20, alpha:1.0)
        cell.selectedBackgroundView = myCustomSelectionColorView;
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

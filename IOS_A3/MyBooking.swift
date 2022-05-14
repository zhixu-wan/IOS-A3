//
//  MyBooking.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/12.
//

import Foundation

import UIKit

class MyBooking: UIViewController {
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var customer = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.mySearchBar.placeholder = "type id to search"
    }
    
}

extension MyBooking: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.findCustomers().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myBookingCell") as! MyBookingCell
        let customers = appDelegate.findCustomers()
        cell.idLabel.text = "\(customers[indexPath.row].id)"
        cell.nameLabel.text = customers[indexPath.row].nameC
        cell.numLabel.text = "\(customers[indexPath.row].num)"
        cell.statusLabel.text = customers[indexPath.row].status
        cell.restaurLabel.text = customers[indexPath.row].nameR
        cell.cancel() {
            let vc = UIAlertController(title:"Warning!", message: "Make sure you want to cancel the reservation?", preferredStyle: .alert)
            vc.addAction(UIAlertAction(title: "Back", style: .cancel))
            vc.addAction(UIAlertAction(title: "Ok", style: .destructive) {
                _ in
                self.appDelegate.deleteCustomer(id: Int(cell.idLabel.text!)!)
                self.appDelegate.addNumTable(name: cell.restaurLabel.text!)
                
            })
            self.present(vc, animated: true)
        }
        return cell
    }
    
}

extension MyBooking: UITableViewDelegate {
    
}

extension MyBooking: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("[MyBooking searchBar] searchText: \(searchText)")
        if searchText == "" {
            self.customer = appDelegate.findCustomers()
        } else {
            
        }
        self.myTableView.reloadData()
    }
}

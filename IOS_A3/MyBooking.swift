//
//  MyBooking.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/12.
//

import Foundation

import UIKit

class MyBooking: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
}

extension MyBooking: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myBookingCell") as! MyBookingCell
        let customers = appDelegate.findCustomers()
        cell.idLabel.text = "\(customers[indexPath.row].id)"
        cell.nameLabel.text = customers[indexPath.row].name
        cell.numLabel.text = "\(customers[indexPath.row].num)"
        cell.statusLabel.text = customers[indexPath.row].status
        
        return cell
    }
    
    
}

extension MyBooking: UITableViewDelegate {
    
}

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
        appDelegate.updateCustomer()
    }
    
}

extension MyBooking: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.listCustomers().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myBookingCell") as! MyBookingCell
        cell.delegate = self
        let customers = appDelegate.listCustomers()
        cell.idLabel.text = "\(customers[indexPath.row].id)"
        cell.nameLabel.text = customers[indexPath.row].nameC
        cell.numLabel.text = "\(customers[indexPath.row].num)"
        cell.statusLabel.text = customers[indexPath.row].status
        cell.restaurLabel.text = customers[indexPath.row].nameR
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        cell.dateLabel.text = dateFormatter.string(from: customers[indexPath.row].date!)
            
        return cell
    }
    
}

extension MyBooking: UITableViewDelegate {
    
}

extension MyBooking: myBookingCellDelegate {
    func cancelReser(id: Int, status: String) {
        if status == "on-going" {
            let vc = UIAlertController(title: "Warning!", message: "Make sure you want to cancel the reservation", preferredStyle: .alert)
            vc.addAction(UIAlertAction(title: "Back", style: .cancel))
            vc.addAction(UIAlertAction(title: "OK", style: .destructive) {
                _ in
                self.appDelegate.deleteCustomer(id: id)
                self.appDelegate.updateStatus(id: id)
                self.myTableView.reloadData()
            })
            self.present(vc, animated: true)
        } else {
            let vc = UIAlertController(title: "Warning!", message: "You cannot cancel this booking, this booking has been completed/cancelled", preferredStyle: .alert)
            vc.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(vc, animated: true)
        }
    }
}

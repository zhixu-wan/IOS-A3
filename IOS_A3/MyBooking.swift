//
//  MyBooking.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/12.
//

import Foundation

import UIKit

class MyBooking: UIViewController {

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
        let cell = 
    }
    
    
}

extension MyBooking: UITableViewDelegate {
    
}

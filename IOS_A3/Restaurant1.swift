//
//  Restaurant1.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/13.
//

import Foundation

import UIKit

class Restaurant1: UIViewController {
    


    @IBOutlet weak var myView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
}
extension Restaurant1: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let booking = myView.dequeueReusableCell(withIdentifier: "booking")
            return booking!
    }
    
    
   
    
   
    
    
    
}
extension Restaurant1: UITableViewDelegate{
    
}

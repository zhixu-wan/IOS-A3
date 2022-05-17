//
//  Restaurant2.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/13.
//

import Foundation

import UIKit

class CustomerController: UIViewController {
    
    @IBOutlet var CusName: UITextField!
    @IBOutlet var PhoneNumber: UITextField!
    @IBOutlet var PeoNumSlider: UISlider!
    @IBOutlet var numLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PeoNumSlider.value = Float(numLabel.text!)!
        
    }
    
    @IBAction func change(_ sender: Any) {
        let value = Int(PeoNumSlider.value)
        numLabel.text = "\(value)"
    }
}


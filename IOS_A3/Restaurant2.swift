//
//  Restaurant2.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/13.
//

import Foundation

import UIKit

class Restaurant2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextButton()
    }
    
    func nextButton() {
        let next = UIButton(frame: CGRect(x: view.layer.frame.midX-50, y: view.layer.frame.maxY-200, width: 100, height: 100))
        next.layer.cornerRadius = 50
        next.clipsToBounds = true
        next.setImage(UIImage(named: "go"), for: .normal)
        view.addSubview(next)
        next.addTarget(self, action: #selector(bookClick), for: .touchUpInside)
    }
    
    @objc func bookClick(sender: UIButton) {
        performSegue(withIdentifier: "fromR2Segue", sender: nil)
    }
    
}

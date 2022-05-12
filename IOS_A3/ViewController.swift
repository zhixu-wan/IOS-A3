//
//  ViewController.swift
//  IOS_A3
//
//  Created by ray on 2022/5/12.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logoImage()
    }

    
    func logoImage() {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.layer.frame = CGRect(x: view.layer.frame.midX-80, y: view.layer.frame.midY-300, width: 160, height: 160)
        logo.layer.cornerRadius = 80
        logo.clipsToBounds = true
        
        view.addSubview(logo)
    }
}


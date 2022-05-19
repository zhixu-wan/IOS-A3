//
//  ViewController.swift
//  IOS_A3
//
//  Created by ray on 2022/5/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var slogan: UILabel!
    var time = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewButton.isHidden = true
        startButton.isHidden = true
        logoImage()
        labelAppear()
        buttonAppear()
    }
    
    func logoImage() {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.layer.frame = CGRect(x: view.layer.frame.midX-100, y: view.layer.frame.midY-300, width: 200, height: 200)
        logo.layer.cornerRadius = 100
        logo.clipsToBounds = true
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = 2
        animation.fromValue = 0
        animation.toValue = 1
        logo.layer.add(animation, forKey: nil)
        view.addSubview(logo)
    }
    
    func labelAppear() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 2
        animation.fromValue = 0
        animation.toValue = 1
        slogan.layer.add(animation, forKey: nil)
    }
    
    func buttonAppear() {
        startButton.layer.cornerRadius = 5
        startButton.layer.masksToBounds = true
        viewButton.layer.cornerRadius = 5
        viewButton.layer.masksToBounds = true
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            if self.time > 1 {
                self.time -= 1
            } else {
                self.viewButton.isHidden = false
                self.startButton.isHidden = false
                timer.invalidate()
            }
        }
    }
}


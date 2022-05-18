//
//  RestaurantList.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/12.
//

import Foundation

import UIKit

class RestaurantList: UIViewController {

    @IBOutlet weak var nameR1: UILabel!
    @IBOutlet weak var desR1: UILabel!
    @IBOutlet weak var locationR1: UILabel!
    @IBOutlet weak var nameR2: UILabel!
    @IBOutlet weak var desR2: UILabel!
    @IBOutlet weak var locationR2: UILabel!
    
    @IBOutlet weak var bookR1: UIButton!
    @IBOutlet weak var bookR2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstRestaurant()
        secondRestaurant()
        
    }
    
    func firstRestaurant() {
        let logoRestaurant = UIImageView(image: UIImage(named: "pizzahut"))
        logoRestaurant.layer.frame = CGRect(x: view.layer.frame.midX-207, y: view.layer.frame.minY+90, width: 414, height: 180)
        view.addSubview(logoRestaurant)
        nameR1.text = "Pizza Hub"
        desR1.text = "TRIPLE CHEESE PEPPERONI & PORTOBELLO PIZZA for only $7"
        locationR1.text = "5 Kings Street Zetland"
        bookR1.layer.cornerRadius = 5
        bookR1.layer.masksToBounds = true
        let locationIcon = UIImageView(image: UIImage(named: "locationIcon"))
        locationIcon.layer.frame = CGRect(x: view.layer.frame.minX+10, y: view.layer.frame.midY-100, width: 35, height: 35)
        view.addSubview(locationIcon)
    }
    
    func secondRestaurant() {
        let logoRestaurant = UIImageView(image: UIImage(named: "thebest"))
        logoRestaurant.layer.frame = CGRect(x: view.layer.frame.midX-207, y: view.layer.frame.midY, width: 414, height: 180)
        view.addSubview(logoRestaurant)
        nameR2.text = "The Best"
        desR2.text = "Sydney’s best fine diner and a world-class culinary experience."
        locationR2.text = "28 Ray Street Mascot"
        bookR2.layer.cornerRadius = 5
        bookR2.layer.masksToBounds = true
        let locationIcon = UIImageView(image: UIImage(named: "locationIcon"))
        locationIcon.layer.frame = CGRect(x: view.layer.frame.minX+10, y: view.layer.frame.midY+258, width: 35, height: 35)
        view.addSubview(locationIcon)
    }
}

//
//  RestaurantList.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/12.
//

import Foundation

import UIKit

class RestaurantList: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var RestaurantTableView: UITableView!
    
    let titlesF = [("Pizza Hub"),("The Best")]
    let desF = [("TRIPLE CHEESE PEPPERONI & PORTOBELLO PIZZA for only $7"),
                ("Sydney’s best fine diner and a world-class culinary experience in every respect.")]
    let imagesF = [UIImage(named: "pizzahut"),
                   UIImage(named: "thebest"),]
    let imagesLocationIcon = [UIImage(named: "locationIcon"), UIImage(named: "locationIcon")]
    
    let location = [("5 Kings Street Zetland"),
                ("28 Ray Street Mascot")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        RestaurantTableView.delegate = self
        RestaurantTableView.dataSource = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesF.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RestaurantTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! TableViewCell
        cell.pizzaHubCell.image = self.imagesF[indexPath.row]
        cell.pizzaHubTitle.text = self.titlesF[indexPath.row]
        cell.pizzaHubText1.text = self.desF[indexPath.row]
        cell.locationIcon.image = self.imagesLocationIcon[indexPath.row]
        cell.location.text = self.location[indexPath.row]
        return cell
    }
}

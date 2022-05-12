//
//  TableViewCell.swift
//  IOS_A3
//
//  Created by ray on 2022/5/12.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var pizzaHubCell: UIImageView!
    
    @IBOutlet weak var pizzaHubTitle: UILabel!
    
    @IBOutlet weak var pizzaHubText1: UILabel!
    
    @IBOutlet weak var Book: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

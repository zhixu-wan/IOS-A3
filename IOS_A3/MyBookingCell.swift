//
//  MyBookingCell.swift
//  IOS_A3
//
//  Created by Zhixu Wan on 2022/5/12.
//

import UIKit

protocol myBookingCellDelegate {
    func cancelReser(id: Int, status: String)
}

class MyBookingCell: UITableViewCell {
    var delegate: myBookingCellDelegate?
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var restaurLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func cancel(_ sender: Any) {
        delegate?.cancelReser(id: Int(idLabel.text!)!, status: statusLabel.text!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

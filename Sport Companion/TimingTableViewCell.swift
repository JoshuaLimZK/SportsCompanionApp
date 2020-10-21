//
//  TimingTableViewCell.swift
//  Sport Companion
//
//  Created by Joshua Lim on 21/10/20.
//

import UIKit

class TimingTableViewCell: UITableViewCell {

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TimerTableViewCell.swift
//  Doro
//
//  Created by Adly Thebaud on 11/24/17.
//  Copyright © 2017 ThebaudHouse. All rights reserved.
//

import UIKit

class TimerTableViewCell: UITableViewCell {
   
   @IBOutlet weak var nameLabel: UILabel!
   @IBOutlet weak var descriptionLabel: UILabel!
   @IBOutlet weak var workLengthLabel: UILabel!
   @IBOutlet weak var breakLengthLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  NotificationTableViewCell.swift
//  Citimate
//
//  Created by Hitaishin on 10/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    // IBOutles
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userDescriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

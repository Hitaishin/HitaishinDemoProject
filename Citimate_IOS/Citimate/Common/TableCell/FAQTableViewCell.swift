//
//  FAQTableViewCell.swift
//  Citimate
//
//  Created by Hitaishin on 04/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    // IBOutles
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dividerLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

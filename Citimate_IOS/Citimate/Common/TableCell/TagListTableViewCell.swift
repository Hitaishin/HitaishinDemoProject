//
//  TagListTableViewCell.swift
//  Citimate
//
//  Created by Hitaishin on 08/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class TagListTableViewCell: UITableViewCell {
    // IBOutles
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var placeCountLabel: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var placeNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

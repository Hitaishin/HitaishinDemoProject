//
//  FollowerTableViewCell.swift
//  Citimate
//
//  Created by Hitaishin on 08/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class FollowerTableViewCell: UITableViewCell {
    // IBOutles
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var followingButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

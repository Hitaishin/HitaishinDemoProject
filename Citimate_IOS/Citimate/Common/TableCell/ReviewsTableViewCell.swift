//
//  ReviewsTableViewCell.swift
//  Citimate
//
//  Created by Hitaishin on 07/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {
    // IBOutles
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var ratingView: FloatRatingView!
    @IBOutlet weak var ratingTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

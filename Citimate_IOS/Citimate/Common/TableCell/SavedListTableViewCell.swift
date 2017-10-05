//
//  SavedListTableViewCell.swift
//  Citimate
//
//  Created by Hitaishin on 08/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class SavedListTableViewCell: UITableViewCell {
    // IBOutles
    @IBOutlet weak var floatRatingView: FloatRatingView!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var distanceButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var addTagButton: UIButton!
    @IBOutlet weak var myPubLabel: UILabel!
    @IBOutlet weak var beerSectionLabel: UILabel!
    @IBOutlet weak var friendsJoyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

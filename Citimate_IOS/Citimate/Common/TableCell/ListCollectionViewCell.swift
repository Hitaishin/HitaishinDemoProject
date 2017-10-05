//
//  ListCollectionViewCell.swift
//  Citimate
//
//  Created by Hitaishin on 07/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    // IBOutles
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var floatRatingView: FloatRatingView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var shadowImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var placeImageViewWidth: NSLayoutConstraint!
}

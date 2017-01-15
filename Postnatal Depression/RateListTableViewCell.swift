//
//  RateListTableViewCell.swift
//  Postnatal Depression
//
//  Created by iParth on 1/3/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit
import HCSStarRatingView

class RateListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vRate: HCSStarRatingView?
    @IBOutlet weak var lblCategoryTitle: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

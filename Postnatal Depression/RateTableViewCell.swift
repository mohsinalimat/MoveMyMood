//
//  RateTableViewCell.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/17/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit
import HCSStarRatingView

class RateTableViewCell: UITableViewCell {
    @IBOutlet weak var vRate: HCSStarRatingView?
    @IBOutlet weak var lblCategoryTitle: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

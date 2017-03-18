//
//  CategoryTableViewCell.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/15/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCategory: UIView!
    @IBOutlet weak var lblCategoryTitle: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  LocationTableViewCell.swift
//  Lunch Meet
//
//  Created by greyson on 8/22/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var addressLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
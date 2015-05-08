//
//  FriendTableViewCell.swift
//  Lunch Meet
//
//  Created by greyson on 5/8/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

	@IBOutlet var profileImageView: UIImageView!
	@IBOutlet var firstNameLabel: UILabel!
	@IBOutlet var lastNameLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

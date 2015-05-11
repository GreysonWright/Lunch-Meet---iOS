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
		
		profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2;
		profileImageView.clipsToBounds = true;
		
		profileImageView.layer.borderWidth = 1
		profileImageView.layer.borderColor = UIColor(red: 75/255, green: 102/255, blue: 153/255, alpha: 1).CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

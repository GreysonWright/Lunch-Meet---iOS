//
//  MainTableViewCell.swift
//  Lunch Meet
//
//  Created by greyson on 7/3/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

	@IBOutlet var eventImageView: UIImageView!
	@IBOutlet var nameLabel: UILabel!
	@IBOutlet var locationLabel: UILabel!
	@IBOutlet var dateLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

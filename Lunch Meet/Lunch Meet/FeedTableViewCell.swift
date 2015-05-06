//
//  FeedTableViewCell.swift
//  Lunch Meet
//
//  Created by greyson on 5/1/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

	@IBOutlet var eventLabel: UILabel!
	@IBOutlet var detailsLabel: UILabel!
	@IBOutlet var dateLabel: UILabel!
	@IBOutlet var feedImage: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

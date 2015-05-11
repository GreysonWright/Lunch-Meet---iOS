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
		
		feedImage.layer.cornerRadius = feedImage.frame.size.width / 2;
		feedImage.clipsToBounds = true;
		
		feedImage.layer.borderWidth = 1
		feedImage.layer.borderColor = UIColor(red: 75/255, green: 102/255, blue: 153/255, alpha: 1).CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

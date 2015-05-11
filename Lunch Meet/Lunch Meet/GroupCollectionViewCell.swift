//
//  GroupCollectionViewCell.swift
//  Lunch Meet
//
//  Created by greyson on 5/7/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var nameLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		imageView.layer.cornerRadius = imageView.frame.size.width / 2;
		imageView.clipsToBounds = true;
		
		imageView.layer.borderWidth = 1
		imageView.layer.borderColor = UIColor(red: 75/255, green: 102/255, blue: 153/255, alpha: 1).CGColor
    }

}

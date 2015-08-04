//
//  Button.swift
//  Lunch Meet
//
//  Created by greyson on 6/27/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class Button: UIButton {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
		super.drawRect(rect)
		
		layer.masksToBounds = true
		layer.cornerRadius = 3
		
    }

}

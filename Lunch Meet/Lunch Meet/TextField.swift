//
//  TextField.swift
//  Lunch Meet
//
//  Created by greyson on 6/21/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class TextField: UITextField {
	
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
		super.drawRect(rect)
		
		layer.masksToBounds = true
		layer.cornerRadius = 3
		
		self.tintColor = UIColor.grey700()
		
    }

	override func textRectForBounds(bounds: CGRect) -> CGRect {
		super.textRectForBounds(bounds)
		
		return CGRectInset( bounds , 10 , 0 )
	
	}
	
	override func editingRectForBounds(bounds: CGRect) -> CGRect {
		super.editingRectForBounds(bounds)
		
		return CGRectInset( bounds , 10 , 0 )
		
	}
	
}

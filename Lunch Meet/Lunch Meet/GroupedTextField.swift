//
//  GroupedTextField.swift
//  Lunch Meet
//
//  Created by greyson on 8/1/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class GroupedTextField: UITextField {
	
    override func drawRect(rect: CGRect) {
		super.drawRect(rect)
		
		let bottomBorder = CALayer()
		bottomBorder.frame = CGRectMake(0, frame.size.height - 0.5, frame.size.width, 0.5)
		bottomBorder.backgroundColor = UIColor.blue700().CGColor
		layer.addSublayer(bottomBorder)
		
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

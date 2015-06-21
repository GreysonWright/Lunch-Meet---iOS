//
//  TextField.swift
//  Lunch Meet
//
//  Created by greyson on 6/21/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class TextField: UITextField {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

	override func textRectForBounds(bounds: CGRect) -> CGRect {
		
		return CGRectInset( bounds , 10 , 0 )
	
	}
	
	override func editingRectForBounds(bounds: CGRect) -> CGRect {

		return CGRectInset( bounds , 10 , 0 )
		
	}
	
}

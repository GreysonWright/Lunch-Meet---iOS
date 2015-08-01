//
//  TableViewCell.m
//  Test
//
//  Created by Greyson Wright on 7/30/15.
//  Copyright © 2015 uacaps. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

	[self addBorder];
	
}

- (void)setFrame:(CGRect)frame {
	[super setFrame: frame];
	
	[self addBorder];
	
}

- (void)addBorder {
	
	if (self.shouldAddBorder) {
	
		for (CALayer *layer in self.layer.sublayers) {
			
			if ([layer.name isEqual: @"Border"]) {
				
				layer.frame = CGRectMake(0.0f, self.bounds.size.height - 1, self.frame.size.width, 0.5f);
				break;
				
			} else {
				
				CALayer *bottomBorder = [CALayer layer];
				bottomBorder.frame = CGRectMake(0.0f, self.bounds.size.height - 1, self.frame.size.width, 0.5f);
				bottomBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
				bottomBorder.name = @"Border";
				
				[self.layer addSublayer:bottomBorder];
				
				break;
				
			}
			
		}
		
	}
	
}

@end

//
//  TableViewCell.h
//  Test
//
//  Created by Greyson Wright on 7/30/15.
//  Copyright © 2015 uacaps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property BOOL shouldAddBorder;

@end

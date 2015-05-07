//
//  Group.h
//  Lunch Meet
//
//  Created by greyson on 5/7/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "User.h"

@interface Group : NSObject

@property NSString *name;
@property UIImage *image;
@property User *owner;
@property NSArray *members;

@end

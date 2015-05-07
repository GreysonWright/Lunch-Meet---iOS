//
//  User.h
//  Lunch Meet
//
//  Created by greyson on 4/30/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property NSNumber *id;
@property UIImage *profileImage;
@property NSString *firstName;
@property NSString *lastName;
@property NSDate *birthDate;
@property NSString *favoritePlace;
@property NSString *city;
@property NSString *state;

@end

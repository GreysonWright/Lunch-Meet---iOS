//
//  LoginResponse.h
//  Lunch Meet
//
//  Created by greyson on 4/30/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccessToken.h"
#import "User.h"

@interface LoginResponse : NSObject

@property AccessToken *accessToken;
@property User *user;

@end

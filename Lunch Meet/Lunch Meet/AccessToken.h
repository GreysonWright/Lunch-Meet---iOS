//
//  AccessToken.h
//  Lunch Meet
//
//  Created by greyson on 4/30/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessToken : NSObject

@property NSString *token;
@property NSDate *expiration;

@end

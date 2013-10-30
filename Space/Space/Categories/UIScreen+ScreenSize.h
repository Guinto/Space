//
//  UIScreen+ScreenSize.h
//  Project-Gator
//
//  Created by Trent Ellingsen on 10/7/13.
//  Copyright (c) 2013 MindBody Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SPScreenSize) {
    SPScreenSize3_5,
    SPScreenSize4
};

@interface UIScreen (ScreenSize)

+ (float)height;
+ (float)width;
+ (SPScreenSize)screenSize;

@end

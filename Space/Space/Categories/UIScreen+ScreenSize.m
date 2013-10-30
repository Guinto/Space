//
//  UIScreen+ScreenSize.m
//  Project-Gator
//
//  Created by Trent Ellingsen on 10/7/13.
//  Copyright (c) 2013 MindBody Inc. All rights reserved.
//

#import "UIScreen+ScreenSize.h"

@implementation UIScreen (ScreenSize)

+ (float)height
{
    return [[[self class] mainScreen] bounds].size.height;
}

+ (float)width
{
    return [[[self class] mainScreen] bounds].size.width;
}

+ (SPScreenSize)screenSize
{
	if ([[[self class] mainScreen] bounds].size.height == 480) {
		return SPScreenSize3_5;
    }
	
	return SPScreenSize4;
}

@end

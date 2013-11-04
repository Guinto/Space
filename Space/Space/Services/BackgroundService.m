//
//  BackgroundService.m
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "BackgroundService.h"
#import "UIScreen+ScreenSize.h"
#import "SPEnums.h"

@interface BackgroundService ()

@end

@implementation BackgroundService

- (id)init
{
    self = [super init];
    
    if (self) {
        self.background = [[Background alloc] init];
        self.background.sprite.position = CGPointMake([UIScreen width] / 2, [UIScreen height] / 2);
        self.background.stageLevel = SPStageLevel1;
    }
    
    return self;
}

+ (BackgroundService *)sharedService
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedService = nil;
    
    dispatch_once(&pred, ^{
        _sharedService = [[self alloc] init];
	});
    
    return _sharedService;
}
@end

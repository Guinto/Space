//
//  PlayerService.m
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "PlayerService.h"
#import "Player.h"
#import "UIScreen+ScreenSize.h"

@interface PlayerService ()

@end

@implementation PlayerService

- (CGPoint)position
{
    return self.player.sprite.position;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.player = [[Player alloc] init];
        self.player.sprite.position = CGPointMake([UIScreen width] / 2, [UIScreen height] / 4);
    }
    
    return self;
}

+ (PlayerService *)sharedService
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedService = nil;
    
    dispatch_once(&pred, ^{
        _sharedService = [[self alloc] init];
	});
    
    return _sharedService;
}

@end

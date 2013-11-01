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

#define MOVEMENT_AXIS_MODIFIER 12
#define OFF_SCREEN_PADDING 10

@interface PlayerService ()

@end

@implementation PlayerService

- (void)move:(float)moveAmount
{
    self.player.sprite.position = CGPointMake(self.player.sprite.position.x + moveAmount, self.player.sprite.position.y);
    
    if (self.player.sprite.position.x < -OFF_SCREEN_PADDING) {
        self.player.sprite.position = CGPointMake([UIScreen width] + OFF_SCREEN_PADDING, self.player.sprite.position.y);
    } else if (self.player.sprite.position.x > [UIScreen width] + OFF_SCREEN_PADDING) {
        self.player.sprite.position = CGPointMake(-OFF_SCREEN_PADDING, self.player.sprite.position.y);
    }
}

- (void)updatePosition
{
    float deviceXAxis = self.motionManager.accelerometerData.acceleration.x;
    
    [self move:MOVEMENT_AXIS_MODIFIER * deviceXAxis];
}

- (void)update:(CFTimeInterval)dt
{
    if (self.player.hit) {
        self.player = nil;
    }
    
    [self updatePosition];
}

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

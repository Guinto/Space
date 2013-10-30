//
//  MyScene.m
//  Space
//
//  Created by Trent Ellingsen on 10/28/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "MyScene.h"
#import "LaserService.h"
#import "PlayerService.h"
#import "BackgroundService.h"

@interface MyScene ()

@property (nonatomic) LaserService *laserService;
@property (nonatomic) PlayerService *playerService;
@property (nonatomic) BackgroundService *backgroundService;

@property (nonatomic) CFTimeInterval previousTime;

@end

@implementation MyScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        self.backgroundService = [BackgroundService sharedService];
        self.laserService = [LaserService sharedService];
        self.playerService = [PlayerService sharedService];
        
        [self addChild:self.backgroundService.background.sprite];
        
        [self addChild:self.playerService.player.sprite];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        [self addChild:[[LaserService sharedService] shootPlayerLaser]];
    }
}

- (void)update:(CFTimeInterval)currentTime
{
    CFTimeInterval dt = currentTime - self.previousTime;
    
    [self.laserService update:dt];
    
    self.previousTime = currentTime;
}

@end

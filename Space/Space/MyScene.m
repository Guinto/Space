//
//  MyScene.m
//  Space
//
//  Created by Trent Ellingsen on 10/28/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "MyScene.h"
#import "BackgroundService.h"
#import "LaserService.h"
#import "PlayerService.h"
#import "AlienService.h"
#import "GameLogicService.h"
#import "SPConstants.h"

@interface MyScene ()

@property (nonatomic) CFTimeInterval previousTime;

@end

@implementation MyScene

- (void)alienSpawned:(NSNotification *)notification
{
    if ([notification.object isKindOfClass:[SKSpriteNode class]]) {
        [self addChild:notification.object];
    } else {
        NSLog(@"%@", notification.object);
    }
}

- (void)registerNotificationsObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(alienSpawned:)
                                                 name:SPAlienSpawned
                                               object:nil];
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
    
    [[GameLogicService sharedService] update:dt];
    
    self.previousTime = currentTime;
}

- (void)initSceneWithSprites
{
    [self addChild:[BackgroundService sharedService].background.sprite];
    [self addChild:[PlayerService sharedService].player.sprite];
}

- (id)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    
    if (self) {
        [self initSceneWithSprites];
        [self registerNotificationsObservers];
    }
    
    return self;
}

@end

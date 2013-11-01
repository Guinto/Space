//
//  MyScene.m
//  Space
//
//  Created by Trent Ellingsen on 10/28/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "MyScene.h"
#import "BackgroundService.h"
#import "LaserService.h"
#import "PlayerService.h"
#import "AlienService.h"
#import "GameLogicService.h"
#import "SPConstants.h"

@interface MyScene () <UIAccelerometerDelegate>

@property (nonatomic) CFTimeInterval previousTime;
@property (nonatomic) CMMotionManager *motionManager;

@end

@implementation MyScene

#pragma mark - notification methods

- (void)registerNotificationsObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(alienSpawned:)
                                                 name:SPAlienSpawnedNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(spriteDestroyed:)
                                                 name:SPPlayerDestroyedNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(spriteDestroyed:)
                                                 name:SPAlienDestroyedNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(spriteDestroyed:)
                                                 name:SPLaserDestroyedNotification
                                               object:nil];
}

- (void)alienSpawned:(NSNotification *)notification
{
    if ([notification.object isKindOfClass:[SKSpriteNode class]]) {
        [self addChild:notification.object];
    } else {
        NSAssert(0, @"Should be a sprite");
    }
}

- (void)spriteDestroyed:(NSNotification *)notification
{
    if ([notification.object isKindOfClass:[SKSpriteNode class]]) {
        [self removeChildrenInArray:@[notification.object]];
    } else {
        NSAssert(0, @"Should be a sprite");
    }
}

#pragma mark - interaction methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        [self addChild:[[LaserService sharedService] shootPlayerLaser]];
    }
}

#pragma mark - update methods

- (void)update:(CFTimeInterval)currentTime
{
    CFTimeInterval dt = currentTime - self.previousTime;
    
    [[GameLogicService sharedService] update:dt];
    
    self.previousTime = currentTime;
}

#pragma mark - configure methods

- (void)configureAccelerometer
{
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.06;
    
    [self.motionManager startAccelerometerUpdates];
    [PlayerService sharedService].motionManager = self.motionManager;
}

#pragma mark - init methods

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
        [self configureAccelerometer];
    }
    
    return self;
}

@end

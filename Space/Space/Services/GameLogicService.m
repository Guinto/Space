//
//  GameLogicService.m
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "GameLogicService.h"
#import "AlienService.h"
#import "SPConstants.h"
#import "LaserService.h"
#import "PlayerService.h"

@interface GameLogicService ()

@property (nonatomic) CFTimeInterval timeSinceAlienSpawn;

@end

@implementation GameLogicService

#pragma mark - Logic methods

- (void)alienSpawnLogic:(CFTimeInterval)dt
{
    self.timeSinceAlienSpawn += dt;
    
    if (self.timeSinceAlienSpawn > 1) {
        SKSpriteNode *alienSprite = [[AlienService sharedService] spawnAlien];
        self.timeSinceAlienSpawn = 0;
        [[NSNotificationCenter defaultCenter] postNotificationName:SPAlienSpawnedNotification
                                                            object:alienSprite];
    }
}

#pragma mark - hit test methods

- (void)hitTesting
{
    [self hitTestPlayer];
    [self hitTestLasers];
}

- (void)hitTestPlayer
{
    id player = [PlayerService sharedService].player;
    NSArray *aliens = [AlienService sharedService].aliens;
    
    for (id alien in aliens) {
        if (CGRectIntersectsRect([player sprite].frame, [alien sprite].frame)) {
            [self playerHit:player];
            [self alienHit:alien];
        }
    }
}

- (void)hitTestLasers
{
    NSArray *playerLasershots = [LaserService sharedService].playerLaserShots;
    NSArray *aliens = [AlienService sharedService].aliens;
    
    for (id laser in playerLasershots) {
        for (id alien in aliens) {
            if (CGRectIntersectsRect([laser sprite].frame, [alien sprite].frame)) {
                [self laserHit:laser];
                [self alienHit:alien];
            }
        }
    }
}

- (void)playerHit:(id)player
{
    [player setHit:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:SPPlayerDestroyedNotification
                                                        object:[player sprite]];
}


- (void)alienHit:(id)alien
{
    [alien setHit:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:SPAlienDestroyedNotification
                                                        object:[alien sprite]];
}

- (void)laserHit:(id)laser
{
    [laser setHit:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:SPLaserDestroyedNotification
                                                        object:[laser sprite]];
}

#pragma mark - update methods

- (void)update:(CFTimeInterval)dt
{
    [self alienSpawnLogic:dt];
    
    [self hitTesting];
    
    [[PlayerService sharedService] update:dt];
    [[LaserService sharedService] update:dt];
    [[AlienService sharedService] update:dt];
}

#pragma mark - init methods

- (id)init
{
    self = [super init];
    
    if (self) {
        self.timeSinceAlienSpawn = 0;
    }
    
    return self;
}

+ (GameLogicService *)sharedService
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedService = nil;
    
    dispatch_once(&pred, ^{
        _sharedService = [[self alloc] init];
	});
    
    return _sharedService;
}

@end

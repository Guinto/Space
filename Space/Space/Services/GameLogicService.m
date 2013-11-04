//
//  GameLogicService.m
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "GameLogicService.h"
#import "SPConstants.h"
#import "AlienService.h"
#import "LaserService.h"
#import "PlayerService.h"
#import "Laser.h"
#import "Player.h"
#import "Alien.h"

#define LASER_SPEED 0.3
#define MID_LEVEL_1_SCORE 1
#define MID_LEVEL_2_SCORE 450
#define MID_LEVEL_3_SCORE 750
#define MID_LEVEL_4_SCORE 1800
#define MID_LEVEL_5_SCORE 3000

@interface GameLogicService ()

@property (nonatomic) CFTimeInterval spawnTime;
@property (nonatomic) CFTimeInterval timeSinceAlienSpawn;
@property (nonatomic) CFTimeInterval timeSinceLaserShot;
@property (nonatomic) float approximateScore;
@property (nonatomic, readonly) float score;

@end

@implementation GameLogicService

#pragma mark - Logic methods

- (float)score
{
    return ceil(self.approximateScore);
}

- (void)alienSpawnLogic:(CFTimeInterval)dt
{
    SKSpriteNode *alienSprite;
    self.timeSinceAlienSpawn += dt;
    
    switch (self.stageLevel) {
        case SPStageLevel1:
            alienSprite = [self alienSpawnLogicStageLevel1:dt];
            break;
        case SPStageLevel2:
            alienSprite = [self alienSpawnLogicStageLevel2:dt];
            break;
        case SPStageLevel3:
            alienSprite = [self alienSpawnLogicStageLevel3:dt];
            break;
        case SPStageLevel4:
            alienSprite = [self alienSpawnLogicStageLevel4:dt];
            break;
        case SPStageLevel5:
            alienSprite = [self alienSpawnLogicStageLevel5:dt];
            break;
            
        default:
            break;
    }
    
    if (alienSprite) {
        float scoreDependance = 0.7 - ceil(self.score / 100) / 10;
        self.spawnTime = arc4random_uniform(80) / 100.0 + (scoreDependance > 0 ? scoreDependance : 0);
        
        self.timeSinceAlienSpawn = 0;
        [[NSNotificationCenter defaultCenter] postNotificationName:SPAlienSpawnedNotification
                                                            object:alienSprite];
    }
}

- (SKSpriteNode *)alienSpawnLogicStageLevel1:(CFTimeInterval)dt
{
    SKSpriteNode *alienSprite;
    
    if (self.score < MID_LEVEL_1_SCORE && self.timeSinceAlienSpawn > self.spawnTime) {
        alienSprite = [[AlienService sharedService] spawnEasyAlien];
    } else if (self.timeSinceAlienSpawn > self.spawnTime) {
        if (arc4random_uniform(2)) {
            alienSprite = [[AlienService sharedService] spawnEasyAlien];
        } else {
            alienSprite = [[AlienService sharedService] spawnHardAlien];
        }
    }
    
    return alienSprite;
}

- (SKSpriteNode *)alienSpawnLogicStageLevel2:(CFTimeInterval)dt
{
    SKSpriteNode *alienSprite;
    
    if (self.score < MID_LEVEL_2_SCORE && self.timeSinceAlienSpawn > self.spawnTime) {
        alienSprite = [[AlienService sharedService] spawnEasyAlien];
    } else if (self.timeSinceAlienSpawn > self.spawnTime) {
        if (arc4random_uniform(2)) {
            alienSprite = [[AlienService sharedService] spawnEasyAlien];
        } else {
            alienSprite = [[AlienService sharedService] spawnHardAlien];
        }
    }
    
    return alienSprite;
}

- (SKSpriteNode *)alienSpawnLogicStageLevel3:(CFTimeInterval)dt
{
    SKSpriteNode *alienSprite;
    
    if (self.score < MID_LEVEL_3_SCORE && self.timeSinceAlienSpawn > self.spawnTime) {
        alienSprite = [[AlienService sharedService] spawnEasyAlien];
    } else if (self.timeSinceAlienSpawn > self.spawnTime) {
        if (arc4random_uniform(2)) {
            alienSprite = [[AlienService sharedService] spawnEasyAlien];
        } else {
            alienSprite = [[AlienService sharedService] spawnHardAlien];
        }
    }
    
    return alienSprite;
}

- (SKSpriteNode *)alienSpawnLogicStageLevel4:(CFTimeInterval)dt
{
    SKSpriteNode *alienSprite;
    
    if (self.score < MID_LEVEL_4_SCORE && self.timeSinceAlienSpawn > self.spawnTime) {
        alienSprite = [[AlienService sharedService] spawnEasyAlien];
    } else if (self.timeSinceAlienSpawn > self.spawnTime) {
        if (arc4random_uniform(2)) {
            alienSprite = [[AlienService sharedService] spawnEasyAlien];
        } else {
            alienSprite = [[AlienService sharedService] spawnHardAlien];
        }
    }
    
    return alienSprite;
}

- (SKSpriteNode *)alienSpawnLogicStageLevel5:(CFTimeInterval)dt
{
    SKSpriteNode *alienSprite;
    
    if (self.score < MID_LEVEL_5_SCORE && self.timeSinceAlienSpawn > self.spawnTime) {
        alienSprite = [[AlienService sharedService] spawnEasyAlien];
    } else if (self.timeSinceAlienSpawn > self.spawnTime) {
        if (arc4random_uniform(2)) {
            alienSprite = [[AlienService sharedService] spawnEasyAlien];
        } else {
            alienSprite = [[AlienService sharedService] spawnHardAlien];
        }
    }
    
    return alienSprite;
}

- (void)fireLasers:(CFTimeInterval)dt
{
    self.timeSinceLaserShot += dt;
    
    if (self.timeSinceLaserShot > LASER_SPEED) {
        SKSpriteNode *laserSprite = [[LaserService sharedService] shootPlayerLaser];
        self.timeSinceLaserShot = 0;
        [[NSNotificationCenter defaultCenter] postNotificationName:SPLaserSpawnedNotification
                                                            object:laserSprite];
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
    NSArray *alienLasershots = [LaserService sharedService].alienLaserShots;
    
    for (id alien in aliens) {
        if (CGRectIntersectsRect([player sprite].frame, [alien sprite].frame)) {
            [self playerHit:player];
            [self alienHit:alien];
        }
    }
    
    for (id laser in alienLasershots) {
        if (CGRectIntersectsRect([laser sprite].frame, [player sprite].frame)) {
            [self laserHit:laser];
            [self playerHit:player];
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

- (void)playerHit:(Player *)player
{
    [player setHit:YES];
    [player animateDestroyedWithCompletion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:SPPlayerDestroyedNotification
                                                            object:[player sprite]];
    }];
}


- (void)alienHit:(Alien *)alien
{
    [alien setHit:YES];
}

- (void)laserHit:(Laser *)laser
{
    [laser setHit:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:SPLaserDestroyedNotification
                                                        object:[laser sprite]];
}

#pragma mark - update methods

- (void)prepareToFireLasers
{
    self.timeSinceLaserShot = LASER_SPEED;
}

- (void)updateScore:(CFTimeInterval)dt
{
    switch (self.stageLevel) {
        case SPStageLevel1:
            self.approximateScore += dt * 10;
            break;
        case SPStageLevel2:
            self.approximateScore += dt * 30;
            break;
        case SPStageLevel3:
            self.approximateScore += dt * 70;
            break;
        case SPStageLevel4:
            self.approximateScore += dt * 180;
            break;
        case SPStageLevel5:
            self.approximateScore += dt * 300;
            break;
            
        default:
            break;
    }
}

- (void)update:(CFTimeInterval)dt
{
    [self updateScore:dt];
    
    [self alienSpawnLogic:dt];
    
    if (self.isFiringLasers) {
        [self fireLasers:dt];
    }
    
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
        self.approximateScore = 0;
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

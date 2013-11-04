//
//  LaserService.m
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "LaserService.h"
#import "Laser.h"
#import "PlayerService.h"
#import "UIScreen+ScreenSize.h"

#define TIME_MODIFIER 500
#define BOTTOM_OF_SCREEN -10

@interface LaserService ()

@end

@implementation LaserService

- (SKSpriteNode *)shootAlienLaser:(Alien *)alien
{
    Laser *shot = [[Laser alloc] init];
    shot.sprite.position = alien.sprite.position;
    
    [self.alienLaserShots addObject:shot];
    
    return shot.sprite;
}

- (SKSpriteNode *)shootPlayerLaser
{
    CGPoint playerPosition = [[PlayerService sharedService] position];
    Laser *shot = [[Laser alloc] init];
    shot.sprite.position = playerPosition;
    
    [self.playerLaserShots addObject:shot];
    
    return shot.sprite;
}

- (void)update:(CFTimeInterval)dt;
{
    [self updatePlayerLasers:dt];
    [self updateAlienLasers:dt];
}

- (void)updatePlayerLasers:(CFTimeInterval)dt
{
    if (self.playerLaserShots.count == 0) {
        return;
    }
    
    NSArray *currentPlayerShots = [self.playerLaserShots copy];
    
    for (Laser *shot in currentPlayerShots)
    {
        if (shot.sprite.position.y > [UIScreen height] || shot.hit) {
            [self.playerLaserShots removeObject:shot];
        } else {
            shot.sprite.position = CGPointMake(shot.sprite.position.x, shot.sprite.position.y + 1 * dt * TIME_MODIFIER);
        }
    }
}

- (void)updateAlienLasers:(CFTimeInterval)dt
{
    if (self.alienLaserShots.count == 0) {
        return;
    }
    
    NSArray *currentAlienShots = [self.alienLaserShots copy];
    
    for (Laser *shot in currentAlienShots)
    {
        if (shot.sprite.position.y < BOTTOM_OF_SCREEN || shot.hit) {
            [self.alienLaserShots removeObject:shot];
        } else {
            shot.sprite.position = CGPointMake(shot.sprite.position.x, shot.sprite.position.y - 1 * dt * TIME_MODIFIER);
        }
    }
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.playerLaserShots = [[NSMutableArray alloc] init];
        self.alienLaserShots = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (LaserService *)sharedService
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedService = nil;
    
    dispatch_once(&pred, ^{
        _sharedService = [[self alloc] init];
	});
    
    return _sharedService;
}

@end

//
//  Alien+EasyStage1.m
//  Space
//
//  Created by Trent Ellingsen on 11/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "AlienHardStage1.h"
#import "LaserService.h"
#import "SPConstants.h"

#define LASER_SPEED 2

@interface AlienHardStage1 ()

@property (nonatomic) NSInteger hits;
@property (nonatomic) CFTimeInterval timeSinceLaserShot;

@end


@implementation AlienHardStage1

- (void)prepareToFireLasers
{
    self.timeSinceLaserShot = LASER_SPEED;
}

- (void)fireLasers:(CFTimeInterval)dt
{
    self.timeSinceLaserShot += dt;
    
    if (self.timeSinceLaserShot > LASER_SPEED) {
        SKSpriteNode *laserSprite = [[LaserService sharedService] shootAlienLaser:self];
        self.timeSinceLaserShot = 0;
        [[NSNotificationCenter defaultCenter] postNotificationName:SPAlienLaserSpawnedNotification
                                                            object:laserSprite];
    }
}

- (void)update:(CFTimeInterval)dt
{
    if (!self.destroyed && self.hit) {
        self.destroyed = YES;
    }
    
    [self fireLasers:dt];
    
    [super update:dt];
}

@end

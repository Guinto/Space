//
//  AsteroidService.m
//  Space
//
//  Created by Trent Ellingsen on 11/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "AsteroidService.h"
#import "UIScreen+ScreenSize.h"
#import "Asteroid.h"

#define TIME_MODIFIER 100
#define OFF_SIDE_SCREEN_PADDING 10
#define OFF_TOP_OF_SCREEN [UIScreen height] + 20

@implementation AsteroidService

- (CGPoint)pointWithRandomXPositionAboveScreen
{
    return CGPointMake(arc4random_uniform([UIScreen width] + OFF_SIDE_SCREEN_PADDING) - OFF_SIDE_SCREEN_PADDING, OFF_TOP_OF_SCREEN);
}

- (SKSpriteNode *)spawnAsteroid
{
    Asteroid *asteroid = [[Asteroid alloc] init];
    asteroid.sprite.position = [self pointWithRandomXPositionAboveScreen];
    
    [self.asteroids addObject:asteroid];
    
    return asteroid.sprite;
}

- (void)update:(CFTimeInterval)dt
{
    if (self.asteroids.count == 0) {
        return;
    }
    
    NSArray *currentAsteroids = [self.asteroids copy];
    
    for (Asteroid *asteroid in currentAsteroids)
    {
        if (asteroid.sprite.position.y < -20) {
            [self.asteroids removeObject:asteroid];
        } else {
            asteroid.sprite.position = CGPointMake(asteroid.sprite.position.x, asteroid.sprite.position.y - 1 * dt * TIME_MODIFIER);
        }
    }
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.asteroids = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (AsteroidService *)sharedService
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedService = nil;
    
    dispatch_once(&pred, ^{
        _sharedService = [[self alloc] init];
	});
    
    return _sharedService;
}

@end

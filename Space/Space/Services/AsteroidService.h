//
//  AsteroidService.h
//  Space
//
//  Created by Trent Ellingsen on 11/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ServiceBase.h"

@interface AsteroidService : ServiceBase

@property (nonatomic) NSMutableArray *asteroids;

- (SKSpriteNode *)spawnAsteroid;
- (void)update:(CFTimeInterval)dt;

+ (AsteroidService *)sharedService;

@end

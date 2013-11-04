//
//  LaserService.h
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ServiceBase.h"
#import "Alien.h"

@interface LaserService : ServiceBase

@property (nonatomic) NSMutableArray *playerLaserShots;
@property (nonatomic) NSMutableArray *alienLaserShots;

- (SKSpriteNode *)shootPlayerLaser;
- (SKSpriteNode *)shootAlienLaser:(Alien *)alien;
- (void)update:(CFTimeInterval)tick;

+ (LaserService *)sharedService;

@end

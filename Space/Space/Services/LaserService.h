//
//  LaserService.h
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ServiceBase.h"

@interface LaserService : ServiceBase

- (SKSpriteNode *)shootPlayerLaser;
- (void)update:(CFTimeInterval)tick;

+ (LaserService *)sharedService;

@end

//
//  AlienService.h
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "ServiceBase.h"
#import "Alien.h"

@interface AlienService : ServiceBase

- (SKSpriteNode *)spawnAlien;
- (void)update:(CFTimeInterval)dt;

+ (AlienService *)sharedService;

@end

//
//  AlienService.h
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ServiceBase.h"

@interface AlienService : ServiceBase

@property (nonatomic) NSMutableArray *aliens;

- (SKSpriteNode *)spawnAlien;
- (void)update:(CFTimeInterval)dt;

+ (AlienService *)sharedService;

@end

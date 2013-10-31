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
#import "AlienService.h"

@interface GameLogicService ()

@property (nonatomic) CFTimeInterval timeSinceAlienSpawn;

@end

@implementation GameLogicService

- (void)update:(CFTimeInterval)dt
{
    self.timeSinceAlienSpawn += dt;
    
    if (self.timeSinceAlienSpawn > 1) {
        SKSpriteNode *alienSprite = [[AlienService sharedService] spawnAlien];
        self.timeSinceAlienSpawn = 0;
        [[NSNotificationCenter defaultCenter] postNotificationName:SPAlienSpawned
                                                            object:alienSprite];
    }
    
    [[LaserService sharedService] update:dt];
    [[AlienService sharedService] update:dt];
}

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

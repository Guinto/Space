//
//  GameLogicService.h
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "ServiceBase.h"
#import "SPEnums.h"

@interface GameLogicService : ServiceBase

@property (nonatomic) NSInteger *gameDifficulty;
@property (nonatomic, getter = isFiringLasers) BOOL fireLasers;
@property (nonatomic) SPStageLevel stageLevel;
@property (nonatomic) SPPlayerRank playerRank;

- (void)prepareToFireLasers;
- (void)update:(CFTimeInterval)dt;

+ (GameLogicService *)sharedService;

@end

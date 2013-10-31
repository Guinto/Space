//
//  GameLogicService.h
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "ServiceBase.h"

@interface GameLogicService : ServiceBase

@property (nonatomic) NSInteger *gameDifficulty;

- (void)update:(CFTimeInterval)dt;

+ (GameLogicService *)sharedService;

@end

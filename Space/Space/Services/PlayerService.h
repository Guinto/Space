//
//  PlayerService.h
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "ServiceBase.h"
#import "Player.h"

@interface PlayerService : ServiceBase

@property (nonatomic) Player *player;

- (void)update:(CFTimeInterval)dt;
- (CGPoint)position;
+ (PlayerService *)sharedService;

@end

//
//  Alien.h
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "DomainObjectBase.h"
#import "SPEnums.h"

@interface Alien : DomainObjectBase

@property (nonatomic) SPShipType alienType;
@property (nonatomic) BOOL destroyed;

- (void)update:(CFTimeInterval)dt;
- (void)animateDestroyedWithCompletion:(void(^)())completion;

- (id)initAsRandomAlien;
- (id)initAsEasyAlienForStageLevel:(SPStageLevel)stageLevel;
- (id)initAsHardAlienForStageLevel:(SPStageLevel)stageLevel;

@end

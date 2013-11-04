//
//  Player.h
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "DomainObjectBase.h"
#import "SPEnums.h"

@interface Player : DomainObjectBase

@property (nonatomic) SPShipType shipType;

- (void)leanLeft;
- (void)leanRight;
- (void)stablize;
- (void)animateDestroyedWithCompletion:(void(^)())completion;

@end

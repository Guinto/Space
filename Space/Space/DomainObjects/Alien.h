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

@property (nonatomic) SPAlienType alienType;

- (void)animateDestroyedWithCompletion:(void(^)())completion;
- (id)initAsRandomAlien;

@end

//
//  DomainObjectBase.h
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <Foundation/Foundation.h>

@interface DomainObjectBase : NSObject

@property (nonatomic) SKSpriteNode *sprite;
@property (nonatomic, getter = isHit) BOOL hit;

@end

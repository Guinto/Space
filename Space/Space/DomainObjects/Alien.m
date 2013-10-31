//
//  Alien.m
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "Alien.h"

@implementation Alien
@synthesize sprite = _sprite;

- (SKSpriteNode *)sprite
{
    if (!_sprite) {
        _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"redFighterAlien"];
    }
    return _sprite;
}

@end

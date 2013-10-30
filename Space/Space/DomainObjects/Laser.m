//
//  Laser.m
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "Laser.h"

@implementation Laser
@synthesize sprite = _sprite;

- (SKSpriteNode *)sprite
{
    if (!_sprite) {
        _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"playerShot"];
    }
    return _sprite;
}

@end

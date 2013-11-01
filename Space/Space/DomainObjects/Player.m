//
//  Player.m
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "Player.h"

@implementation Player
@synthesize sprite = _sprite;

- (SKSpriteNode *)sprite
{
    if (!_sprite) {
        _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"playerShip"];
    }
    return _sprite;
}

- (void)leanLeft
{
    self.sprite.texture = [SKTexture textureWithImageNamed:@"playerLeftShip"];
}

- (void)leanRight
{
    self.sprite.texture = [SKTexture textureWithImageNamed:@"playerRightShip"];
}

- (void)stablize
{
    self.sprite.texture = [SKTexture textureWithImageNamed:@"playerShip"];
}

@end

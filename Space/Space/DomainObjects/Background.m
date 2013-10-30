//
//  Background.m
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "Background.h"
#import "UIScreen+ScreenSize.h"

@implementation Background
@synthesize sprite = _sprite;

- (SKSpriteNode *)createBackground
{
    SKSpriteNode *backgroundSprite;
    SKTexture *textureImage;
    textureImage = [SKTexture textureWithImageNamed:@"spaceBackground"];
    backgroundSprite = [SKSpriteNode spriteNodeWithTexture:textureImage];
    backgroundSprite.position = CGPointMake([UIScreen width] / 2, [UIScreen height] / 2);
    
    return backgroundSprite;
}

- (SKSpriteNode *)sprite
{
    if (!_sprite) {
        _sprite = [self createBackground];
    }
    return _sprite;
}

@end

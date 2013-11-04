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
    SKTexture *textureImage = [self backgroundForCurrentStageLevel];
    backgroundSprite = [SKSpriteNode spriteNodeWithTexture:textureImage];
    backgroundSprite.position = CGPointMake([UIScreen width] / 2, [UIScreen height] / 2);
    
    return backgroundSprite;
}

- (SKTexture *)backgroundForCurrentStageLevel
{
    SKTexture *textureImage;
    
    switch (self.stageLevel) {
        case SPStageLevel1:
            textureImage = [SKTexture textureWithImageNamed:@"spaceBackground.jpg"];
            break;
        case SPStageLevel2:
            textureImage = [SKTexture textureWithImageNamed:@"spaceBackground2.jpg"];
            break;
        case SPStageLevel3:
            textureImage = [SKTexture textureWithImageNamed:@"spaceBackground3.jpg"];
            break;
        case SPStageLevel4:
            textureImage = [SKTexture textureWithImageNamed:@"spaceBackground4.jpg"];
            break;
        case SPStageLevel5:
            textureImage = [SKTexture textureWithImageNamed:@"spaceBackground5.jpg"];
            break;
            
        default:
            break;
    }
    
    return textureImage;
}

- (SKSpriteNode *)sprite
{
    if (!_sprite) {
        _sprite = [self createBackground];
        _sprite.blendMode = SKBlendModeReplace;
    }
    return _sprite;
}

@end

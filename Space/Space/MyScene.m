//
//  MyScene.m
//  Space
//
//  Created by Trent Ellingsen on 10/28/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

- (SKSpriteNode *)createBackground
{
    SKSpriteNode *backgroundSprite;
    SKTexture *textureImage;
    textureImage = [SKTexture textureWithImageNamed:@"spaceBackground"];
    backgroundSprite = [SKSpriteNode spriteNodeWithTexture:textureImage];
    backgroundSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    return backgroundSprite;
}

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        SKSpriteNode *backgroundSprite = [self createBackground];
        [self addChild:backgroundSprite];
        
        SKSpriteNode *playerSprite = [SKSpriteNode spriteNodeWithImageNamed:@"playerShip"];
        playerSprite.position = CGPointMake(CGRectGetMidX(self.frame), 150);
        [self addChild:playerSprite];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *shotSprite = [SKSpriteNode spriteNodeWithImageNamed:@"playerShot"];
        shotSprite.position = location;
        [self addChild:shotSprite];
    }
}

- (void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
}

@end

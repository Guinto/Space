//
//  Player.m
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "Player.h"
#import "SPConstants.h"

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

- (void)animateDestroyedWithCompletion:(void(^)())completion
{
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"playerDestroyed"];
    SKTexture *f1 = [atlas textureNamed:@"playerDestroyed1.png"];
    SKTexture *f2 = [atlas textureNamed:@"playerDestroyed2.png"];
    SKTexture *f3 = [atlas textureNamed:@"playerDestroyed3.png"];
    SKTexture *f4 = [atlas textureNamed:@"playerDestroyed4.png"];
    SKTexture *f5 = [atlas textureNamed:@"playerDestroyed5.png"];
    SKTexture *f6 = [atlas textureNamed:@"playerDestroyed6.png"];
    SKTexture *f7 = [atlas textureNamed:@"playerDestroyed7.png"];
    SKTexture *f8 = [atlas textureNamed:@"playerDestroyed8.png"];
    SKTexture *f9 = [atlas textureNamed:@"playerDestroyed9.png"];
    SKTexture *f10 = [atlas textureNamed:@"playerDestroyed10.png"];
    SKTexture *f11 = [atlas textureNamed:@"playerDestroyed11.png"];
    NSArray *playerExplosionTextures = @[f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11];
    
    SKAction *playerDestroyedAnimation = [SKAction animateWithTextures:playerExplosionTextures timePerFrame:TIME_PER_FRAME];
    [self.sprite runAction:playerDestroyedAnimation completion:^{
        completion();
    }];
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.shipType = SPShipTypePlayerDefault;
    }
    
    return self;
}

@end

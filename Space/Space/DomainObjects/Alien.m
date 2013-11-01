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

- (SKSpriteNode *)spriteWithType:(SPAlienType)alienType
{
    self.alienType = alienType;
    
    switch (alienType) {
        case SPAlienTypeYellowJuggernaut:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"yellowJuggernautAlien"];
            break;
        case SPAlienTypeYellowInterceptor:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"yellowInterceptorAlien"];
            break;
        case SPAlienTypeGreenBomber:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"greenBomberAlien"];
            break;
        case SPAlienTypeGreenFighter:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"greenFighterAlien"];
            break;
        case SPAlienTypeOrangeJuggernaut:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"orangeJuggernautAlien"];
            break;
        case SPAlienTypeRedBomber:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"redBomberAlien"];
            break;
        case SPAlienTypeRedFighter:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"redFighterAlien"];
            break;
        case SPAlienTypeVioletInterceptor:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"violetInterceptorAlien"];
            break;
            
        default:
            break;
    }
    
    return _sprite;
}

- (SKSpriteNode *)randomAlienSprite
{
    return [self spriteWithType:arc4random_uniform(8)];
}

- (void)animateDestroyedWithCompletion:(void(^)())completion
{
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"alienDestroyed"];
    SKTexture *f1 = [atlas textureNamed:@"alienDestroyed1.png"];
    SKTexture *f2 = [atlas textureNamed:@"alienDestroyed2.png"];
    SKTexture *f3 = [atlas textureNamed:@"alienDestroyed3.png"];
    SKTexture *f4 = [atlas textureNamed:@"alienDestroyed4.png"];
    SKTexture *f5 = [atlas textureNamed:@"alienDestroyed5.png"];
    SKTexture *f6 = [atlas textureNamed:@"alienDestroyed6.png"];
    SKTexture *f7 = [atlas textureNamed:@"alienDestroyed7.png"];
    SKTexture *f8 = [atlas textureNamed:@"alienDestroyed8.png"];
    SKTexture *f9 = [atlas textureNamed:@"alienDestroyed9.png"];
    SKTexture *f10 = [atlas textureNamed:@"alienDestroyed10.png"];
    SKTexture *f11 = [atlas textureNamed:@"alienDestroyed11.png"];
    NSArray *alienExplosionTextures = @[f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11];
    
    SKAction *alienDestroyedAnimation = [SKAction animateWithTextures:alienExplosionTextures timePerFrame:0.1];
    [self.sprite runAction:alienDestroyedAnimation completion:^{
        completion();
    }];
}

/**
 Defualts as the Red Fighter
 */
- (SKSpriteNode *)sprite
{
    if (!_sprite) {
        _sprite = [self spriteWithType:SPAlienTypeRedFighter];
    }
    return _sprite;
}

- (id)initAsRandomAlien
{
    self = [super init];
    
    if (self) {
        _sprite = [self randomAlienSprite];
    }
    
    return self;
}

@end

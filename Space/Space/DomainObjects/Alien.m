//
//  Alien.m
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "Alien.h"
#import "SPConstants.h"
#import "AlienEasyStage1.h"
#import "AlienEasyStage2.h"
#import "AlienEasyStage3.h"
#import "AlienEasyStage4.h"
#import "AlienHardStage1.h"
#import "AlienHardStage2.h"
#import "AlienHardStage3.h"
#import "AlienHardStage4.h"

@implementation Alien
@synthesize sprite = _sprite;

- (void)update:(CFTimeInterval)dt
{
    if (self.destroyed) {
        [self animateDestroyedWithCompletion:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:SPAlienDestroyedNotification
                                                                object:self.sprite];
        }];
    }
}

- (SKSpriteNode *)spriteWithType:(SPShipType)alienType
{
    self.alienType = alienType;
    
    switch (alienType) {
        case SPShipTypeAlienTypeYellowJuggernaut:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"yellowJuggernautAlien"];
            break;
        case SPShipTypeAlienTypeYellowInterceptor:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"yellowInterceptorAlien"];
            break;
        case SPShipTypeAlienTypeGreenBomber:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"greenBomberAlien"];
            break;
        case SPShipTypeAlienTypeGreenFighter:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"greenFighterAlien"];
            break;
        case SPShipTypeAlienTypeOrangeJuggernaut:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"orangeJuggernautAlien"];
            break;
        case SPShipTypeAlienTypeRedBomber:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"redBomberAlien"];
            break;
        case SPShipTypeAlienTypeRedFighter:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"redFighterAlien"];
            break;
        case SPShipTypeAlienTypeVioletInterceptor:
            _sprite = [SKSpriteNode spriteNodeWithImageNamed:@"violetInterceptorAlien"];
            break;
            
        default:
            break;
    }
    
    return _sprite;
}

- (SKSpriteNode *)randomAlienSprite
{
    return [self spriteWithType:arc4random_uniform(8) + 1];
}

- (SKSpriteNode *)randomAlienEasySprite
{
    return [self spriteWithType:arc4random_uniform(4) + 1];
}

- (SKSpriteNode *)randomAlienHardSprite
{
    return [self spriteWithType:arc4random_uniform(4) + 5];
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
    
    SKAction *alienDestroyedAnimation = [SKAction animateWithTextures:alienExplosionTextures timePerFrame:TIME_PER_FRAME];
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
        _sprite = [self spriteWithType:SPShipTypeAlienTypeRedFighter];
    }
    return _sprite;
}

- (id)initAsEasyAlienForStageLevel:(SPStageLevel)stageLevel
{
    switch (stageLevel) {
        case SPStageLevel1:
            self = [[AlienEasyStage1 alloc] init];
            self.sprite = [self spriteWithType:SPShipTypeAlienTypeRedFighter];
            break;
        case SPStageLevel2:
            self = [[AlienEasyStage1 alloc] init];
            self.sprite = [self spriteWithType:SPShipTypeAlienTypeYellowInterceptor];
            break;
        case SPStageLevel3:
            self = [[AlienEasyStage1 alloc] init];
            self.sprite = [self spriteWithType:SPShipTypeAlienTypeRedBomber];
            break;
        case SPStageLevel4:
            self = [[AlienEasyStage1 alloc] init];
            self.sprite = [self spriteWithType:SPShipTypeAlienTypeYellowJuggernaut];
            break;
        case SPStageLevel5:
#warning FIGURE THIS OUT
            self.sprite = [self randomAlienEasySprite];
            break;
            
        default:
            break;
    }
    
    return self;
}

- (id)initAsHardAlienForStageLevel:(SPStageLevel)stageLevel
{
    switch (stageLevel) {
        case SPStageLevel1:
            self = [[AlienHardStage1 alloc] init];
            self.sprite = [self spriteWithType:SPShipTypeAlienTypeGreenFighter];
            break;
        case SPStageLevel2:
            self = [[AlienHardStage2 alloc] init];
            self.sprite = [self spriteWithType:SPShipTypeAlienTypeVioletInterceptor];
            break;
        case SPStageLevel3:
            self = [[AlienHardStage3 alloc] init];
            self.sprite = [self spriteWithType:SPShipTypeAlienTypeGreenBomber];
            break;
        case SPStageLevel4:
            self = [[AlienHardStage4 alloc] init];
            self.sprite = [self spriteWithType:SPShipTypeAlienTypeOrangeJuggernaut];
            break;
        case SPStageLevel5:
#warning FIGURE THIS OUT
            self.sprite = [self randomAlienHardSprite];
            break;
            
        default:
            break;
    }
    
    return self;
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

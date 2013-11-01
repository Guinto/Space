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

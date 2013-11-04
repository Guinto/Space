//
//  AlienService.m
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "AlienService.h"
#import "Alien.h"
#import "UIScreen+ScreenSize.h"

#define TIME_MODIFIER 100
#define OFF_SIDE_SCREEN_PADDING 10
#define OFF_TOP_OF_SCREEN [UIScreen height] + 20

@interface AlienService ()

@end

@implementation AlienService

- (CGPoint)pointWithRandomXPositionAboveScreen
{
    return CGPointMake(arc4random_uniform([UIScreen width] + OFF_SIDE_SCREEN_PADDING) - OFF_SIDE_SCREEN_PADDING, OFF_TOP_OF_SCREEN);
}

- (SKSpriteNode *)spawnEasyAlien
{
    Alien *alien = [[Alien alloc] initAsEasyAlienForStageLevel:self.stageLevel];
    alien.sprite.position = [self pointWithRandomXPositionAboveScreen];
    
    [self.aliens addObject:alien];
    
    return alien.sprite;
}

- (SKSpriteNode *)spawnHardAlien
{
    Alien *alien = [[Alien alloc] initAsHardAlienForStageLevel:self.stageLevel];
    alien.sprite.position = [self pointWithRandomXPositionAboveScreen];
    
    [self.aliens addObject:alien];
    
    return alien.sprite;
}

- (void)update:(CFTimeInterval)dt
{
    if (self.aliens.count == 0) {
        return;
    }
    
    NSArray *currentAliens = [self.aliens copy];
    
    for (Alien *alien in currentAliens)
    {
        [alien update:dt];
        if (alien.sprite.position.y < -20 || alien.destroyed) {
            [self.aliens removeObject:alien];
        } else {
            switch (self.stageLevel) {
                case SPStageLevel1:
                    [self updateAlien:alien ForStageLevel1:dt];
                    break;
                case SPStageLevel2:
                    [self updateAlien:alien ForStageLevel1:dt];
                    break;
                case SPStageLevel3:
                    [self updateAlien:alien ForStageLevel1:dt];
                    break;
                case SPStageLevel4:
                    [self updateAlien:alien ForStageLevel1:dt];
                    break;
                case SPStageLevel5:
                    [self updateAlien:alien ForStageLevel1:dt];
                    break;
                    
                default:
                    break;
            }
        }
    }
}

- (void)updateAlien:(Alien *)alien ForStageLevel1:(CFTimeInterval)dt
{
    alien.sprite.position = CGPointMake(alien.sprite.position.x, alien.sprite.position.y - 1 * dt * TIME_MODIFIER);
}

- (void)updateAlien:(Alien *)alien ForStageLevel2:(CFTimeInterval)dt
{
    alien.sprite.position = CGPointMake(alien.sprite.position.x, alien.sprite.position.y - 1.1 * dt * TIME_MODIFIER);
}

- (void)updateAlien:(Alien *)alien ForStageLevel3:(CFTimeInterval)dt
{
    alien.sprite.position = CGPointMake(alien.sprite.position.x, alien.sprite.position.y - 1.2 * dt * TIME_MODIFIER);
}

- (void)updateAlien:(Alien *)alien ForStageLevel4:(CFTimeInterval)dt
{
    alien.sprite.position = CGPointMake(alien.sprite.position.x, alien.sprite.position.y - 1.3 * dt * TIME_MODIFIER);
}

- (void)updateAlien:(Alien *)alien ForStageLevel5:(CFTimeInterval)dt
{
    alien.sprite.position = CGPointMake(alien.sprite.position.x, alien.sprite.position.y - 1.4 * dt * TIME_MODIFIER);
}

- (id)init
{
    self = [super init];
    
    if (self) {
        self.aliens = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (AlienService *)sharedService
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedService = nil;
    
    dispatch_once(&pred, ^{
        _sharedService = [[self alloc] init];
	});
    
    return _sharedService;
}

@end

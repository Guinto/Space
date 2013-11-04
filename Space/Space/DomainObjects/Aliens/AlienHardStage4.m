//
//  Alien+EasyStage1.m
//  Space
//
//  Created by Trent Ellingsen on 11/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "AlienHardStage4.h"

@interface AlienHardStage4 ()

@property (nonatomic) NSInteger hits;

@end


@implementation AlienHardStage4

- (void)update:(CFTimeInterval)dt
{
    if (self.hits >= 2) {
        self.destroyed = YES;
    }
    
    if (!self.destroyed && self.hit) {
        self.hits++;
        self.hit = NO;
    }
    
    [super update:dt];
}

@end

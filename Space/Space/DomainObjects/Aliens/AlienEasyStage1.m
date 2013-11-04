//
//  Alien+EasyStage1.m
//  Space
//
//  Created by Trent Ellingsen on 11/4/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "AlienEasyStage1.h"

@interface AlienEasyStage1 ()

@property (nonatomic) NSInteger hits;

@end


@implementation AlienEasyStage1

- (void)update:(CFTimeInterval)dt
{
    if (!self.destroyed && self.hit) {
        self.destroyed = YES;
    }
    
    [super update:dt];
}

@end

//
//  BackgroundService.h
//  Space
//
//  Created by Trent Ellingsen on 10/29/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

#import "ServiceBase.h"
#import "Background.h"

@interface BackgroundService : ServiceBase

@property (nonatomic) Background *background;

+ (BackgroundService *)sharedService;

@end

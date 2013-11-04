//
//  Enums.h
//  Space
//
//  Created by Trent Ellingsen on 10/30/13.
//  Copyright (c) 2013 Trent Ellingsen. All rights reserved.
//

typedef NS_ENUM(NSUInteger, SPShipType) {
    SPShipTypePlayerDefault,
    SPShipTypeAlienTypeRedFighter,
    SPShipTypeAlienTypeYellowInterceptor,
    SPShipTypeAlienTypeRedBomber,
    SPShipTypeAlienTypeYellowJuggernaut,
    SPShipTypeAlienTypeGreenFighter,
    SPShipTypeAlienTypeVioletInterceptor,
    SPShipTypeAlienTypeGreenBomber,
    SPShipTypeAlienTypeOrangeJuggernaut,
};

typedef NS_ENUM(NSUInteger, SPStageLevel) {
    SPStageLevel1,
    SPStageLevel2,
    SPStageLevel3,
    SPStageLevel4,
    SPStageLevel5
};

typedef NS_ENUM(NSUInteger, SPPlayerRank) {
    SPPlayerRankPrivate,
    SPPlayerRankOfficer,
    SPPlayerRankLieutenant,
    SPPlayerRankCaptain,
    SPPlayerRankCommander
};
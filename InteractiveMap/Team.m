//
//  Team.m
//  InteractiveMap
//
//  Created by Adrian McGee on 8/5/17.
//  Copyright © 2017 Adrian McGee. All rights reserved.
//

#import "Team.h"

@implementation Team

- (instancetype)initWithName:(NSString *)name summary:(NSString *)summary image:(NSString *)image name:(NSString *)trainignGroundName andCoords:(NSString *)coords{
    self = [super init];
    if (self) {
        self.name = name;
        self.nickname = summary;
        self.image = image;
        self.trainingGroundName = trainignGroundName;
        self.coords = coords;
    }

    return self;
}


/*! Returns an array of all the Teams */
+ (NSArray *)getAllTeamItems{
    NSMutableArray *items = [NSMutableArray array];
    [self addTeam:@"Adelaide" withImage:@"adelaide" nickname:@"The Crows" trainingGroundName:@"Football Park" andCoords:@"-34.879816, 138.495729" toModeArray:items];
    [self addTeam:@"Brisbane" withImage:@"brisbane" nickname:@"The Lions" trainingGroundName:@"The Gabba" andCoords:@"-27.485904, 153.038101" toModeArray:items];
    [self addTeam:@"Carlton" withImage:@"carlton" nickname:@"The Blues" trainingGroundName:@"Ikon Park" andCoords:@"-37.783797, 144.961924" toModeArray:items];
    [self addTeam:@"Collingwood" withImage:@"collingwood" nickname:@"The Magpies" trainingGroundName:@"The Holden Center" andCoords:@"-37.824604, 144.980769" toModeArray:items];
    [self addTeam:@"Essendon" withImage:@"essendon" nickname:@"The Blues" trainingGroundName:@"Windy Hill" andCoords:@"--37.751758, 144.919496" toModeArray:items];
    [self addTeam:@"Fremantle" withImage:@"fremantle" nickname:@"The Dockers" trainingGroundName:@"Victor George Kailis Oval" andCoords:@"-32.127038, 115.851553" toModeArray:items];
    [self addTeam:@"Geelong" withImage:@"geelong" nickname:@"The Cats" trainingGroundName:@"Simmonds Stadium" andCoords:@"-38.158152, 144.354571" toModeArray:items];
    [self addTeam:@"Gold Coast" withImage:@"goldcoast" nickname:@"The Suns" trainingGroundName:@"Metricon Stadium" andCoords:@"-28.006494, 153.367171" toModeArray:items];
    [self addTeam:@"GWS" withImage:@"gws" nickname:@"The Giants" trainingGroundName:@"Spotless Stadium" andCoords:@"-33.843027, 151.067636" toModeArray:items];
    [self addTeam:@"Hawthorn" withImage:@"hawthorn" nickname:@"The Hawks" trainingGroundName:@"Waverley Park" andCoords:@"--37.925809, 145.188725" toModeArray:items];
    [self addTeam:@"Melbourne" withImage:@"melbourne" nickname:@"The Demons" trainingGroundName:@"Gosch's Paddock" andCoords:@"-37.826305, 144.987586" toModeArray:items];
    [self addTeam:@"North Melbourne" withImage:@"northmelbourne" nickname:@"The Kangaroos" trainingGroundName:@"Arden Street" andCoords:@"--37.799259, 144.941182" toModeArray:items];
    [self addTeam:@"Port Adelaide" withImage:@"portadelaide" nickname:@"The Power" trainingGroundName:@"Alberton Oval" andCoords:@"-34.864567, 138.519529" toModeArray:items];
    [self addTeam:@"Richmond" withImage:@"richmond" nickname:@"The Tigers" trainingGroundName:@"Punt Road" andCoords:@"-37.822204, 144.988151" toModeArray:items];
    [self addTeam:@"St. Kilda" withImage:@"stkilda" nickname:@"The Saints" trainingGroundName:@"Seaford" andCoords:@"-38.105556, 145.157914" toModeArray:items];
    [self addTeam:@"Sydney" withImage:@"sydney" nickname:@"The Swans" trainingGroundName:@"SCG" andCoords:@"-33.891695, 151.224837" toModeArray:items];
    [self addTeam:@"West Coast" withImage:@"westcoast" nickname:@"The Eagles" trainingGroundName:@"Subiaco Oval" andCoords:@"-31.944662, 115.830062" toModeArray:items];
    [self addTeam:@"Western Bulldogs" withImage:@"westernbulldogs" nickname:@"The Bulldogs" trainingGroundName:@"Whitten Oval" andCoords:@"-37.800318, 144.886511" toModeArray:items];

    return items;
}

/*! Create a Team object and add to Array*/
+ (void)addTeam:(NSString *)name withImage:(NSString *)imagePath nickname:(NSString *)summary trainingGroundName:(NSString *)trainingGroundName andCoords:(NSString *)coords toModeArray: (NSMutableArray *)modeArray{
    Team *team = [[Team alloc] initWithName:name summary:summary image:imagePath name:trainingGroundName andCoords:coords];

    [modeArray addObject:team];
}

@end

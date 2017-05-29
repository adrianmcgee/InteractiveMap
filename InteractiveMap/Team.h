//
//  Team.h
//  InteractiveMap
//
//  Created by Adrian McGee on 8/5/17.
//  Copyright © 2017 Adrian McGee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Team : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *nickname;
@property(nonatomic) NSString *image;
@property(nonatomic, copy) NSString *trainingGroundName;
@property(nonatomic, copy) NSString *coords;
+ (NSArray *)getAllTeamItems;

@end

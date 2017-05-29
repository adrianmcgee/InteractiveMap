//
//  InteractiveMapViewController.h
//  InteractiveMap
//
//  Created by Adrian McGee on 3/5/17.
//  Copyright © 2017 Adrian McGee. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class Team;

@interface InteractiveMapViewController : UIViewController<UIWebViewDelegate>

@property(nonatomic,weak) IBOutlet UIWebView *interactiveMapWebView;
@property (nonatomic, strong)Team *selectedTeam;





@end

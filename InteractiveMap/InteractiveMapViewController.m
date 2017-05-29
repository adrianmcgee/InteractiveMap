//
//  InteractiveMapViewController.m
//  InteractiveMap
//
//  Created by Adrian McGee on 3/5/17.
//  Copyright © 2017 Adrian McGee. All rights reserved.
//

#import "InteractiveMapViewController.h"
#import "Team.h"

@interface InteractiveMapViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation InteractiveMapViewController {
    
}




/*!Load the html file into the webView */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.titleLabel.text = self.selectedTeam.nickname;
    NSString *mapName = @"map";
    NSString *path = [[NSBundle mainBundle] pathForResource:mapName
                                                     ofType:@"html"];
    NSString *content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];

    [self.interactiveMapWebView loadHTMLString:content
                                       baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    
    self.interactiveMapWebView.delegate = self;
    [self setAutomaticallyAdjustsScrollViewInsets:NO];

}


/*! Here we invoke the init function in the JS file by passing the correct coordinates along with it. */
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSArray *items = [self.selectedTeam.coords componentsSeparatedByString:@","];

    NSString *initScript = [NSString stringWithFormat:@"init(\"%@\",\"%@\");", items[0],items[1]];
    
    [self.interactiveMapWebView stringByEvaluatingJavaScriptFromString:initScript];

    [self createMarkerByCoords:self.selectedTeam.coords name:self.selectedTeam.trainingGroundName popupContent:self.selectedTeam.nickname];

}

/*! This method invokes the JS 'createMarker' method */
- (void)createMarkerByCoords:(NSString *)coords name:(NSString *)name
                popupContent:(NSString *)popupContent{

    NSArray *items = [coords componentsSeparatedByString:@","];
    NSString *script = [NSString stringWithFormat:@"createMarker(\"%@\",\"%@\",\"%@\",\"%@\");", items[0], items[1], name, popupContent];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self.interactiveMapWebView stringByEvaluatingJavaScriptFromString:script];
    });


}


- (IBAction)backButtonTapped:(id)sender {

   [self.navigationController popViewControllerAnimated:YES];
}







@end


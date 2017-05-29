//
//  ViewController.m
//  InteractiveMap
//
//  Created by Adrian McGee on 3/5/17.
//  Copyright © 2017 Adrian McGee. All rights reserved.
//

#import "ViewController.h"
#import "InteractiveMapViewController.h"
#import "Team.h"
#import "ClubCollectionViewCell.h"

@interface ViewController ()
@property (nonatomic,strong) NSArray *clubs;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *headerContainerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clubs = [Team getAllTeamItems];
    
    self.headerContainerView.layer.borderColor = [UIColor blackColor].CGColor;
    self.headerContainerView.layer.borderWidth = 0.5;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/*! Navigate to the map view */
- (IBAction)mapButtonTapped:(id)sender {
     InteractiveMapViewController *mapViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"map"];

    [self.navigationController pushViewController:mapViewController animated:YES];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.clubs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    ClubCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"clubCell" forIndexPath:indexPath];
    Team *currentTeam = self.clubs[indexPath.row];
    cell.name.text = currentTeam.name;
    cell.image.image = [UIImage imageNamed:currentTeam.image];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    Team *selectedTeam = self.clubs[indexPath.row];

    InteractiveMapViewController *mapViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"map"];
    mapViewController.selectedTeam = selectedTeam;

    [self.navigationController pushViewController:mapViewController animated:YES];
}


@end

//
//  BannerViewController.m
//  iOSBasicsObjC
//
//  Created by kyoung hee park on 30/01/2019.
//  Copyright © 2019 MayPark. All rights reserved.
//

#import "BannerViewController.h"

@interface BannerViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

// 배너 자동 롤링 처리를 위한 properties
@property BOOL  isBannerPlaying;
@property NSInteger currentBannerIndex;
@property NSInteger maxBannerCount;
@property CGFloat bannerScrollDuration;

@property NSMutableArray *arrColors;
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    // banner
    self.isBannerPlaying = YES;
    self.currentBannerIndex = 0;
    self.bannerScrollDuration = 3.0;

    //데이터 로딩
    self.arrColors = [[NSMutableArray alloc] init];
    
    [self.arrColors addObject:UIColor.darkGrayColor];
    [self.arrColors addObject:UIColor.lightGrayColor];
    [self.arrColors addObject:UIColor.brownColor];

    
    self.maxBannerCount = self.arrColors.count * 10;

    [self.collectionView reloadData];


}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    NSLog(@"viewDidAppear. start to play");
    
    // 프로모션 배너 애니메이션 시작
    __weak id blockSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.bannerScrollDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [blockSelf bannerAdvanceToNext];
    });
    
    
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    self.isBannerPlaying = NO;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}


- (void)bannerAdvanceToNext {
    if (!self.isBannerPlaying) {
        NSLog(@"will return due to unloading");
        return;
    }
    
    
    NSLog(@"Go next banner!");
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.currentBannerIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    self.currentBannerIndex = (self.currentBannerIndex + 1) % self.maxBannerCount;
    __weak id blockSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.bannerScrollDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [blockSelf bannerAdvanceToNext];
    });
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.maxBannerCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = self.arrColors[indexPath.row % self.arrColors.count];
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(collectionView.frame), (CGRectGetHeight(collectionView.frame)));
}

@end

//
//  LCYHeadScrollView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "LCYHeadScrollView.h"

@implementation LCYHeadScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self headCollectionView];
        [self pageControl];
        self.imageArray = @[@"placeholderImage",@"placeholderImage",@"placeholderImage",@"placeholderImage"];
    }
    return self;
}

- (void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    [self.headCollectionView reloadData];
    _pageControl.numberOfPages = self.imageArray.count;
    _pageControl.currentPage = 0;
}

- (UICollectionView *)headCollectionView{
    if (_headCollectionView == nil) {
        self.headLayout = [[LCYScrollFlowLayout alloc] init];
        _headCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.headLayout];
        _headCollectionView.bounces = YES;
        _headCollectionView.delegate = self;
        _headCollectionView.dataSource = self;
        _headCollectionView.showsHorizontalScrollIndicator = NO;
        _headCollectionView.backgroundColor = [UIColor clearColor];
        _headCollectionView.pagingEnabled = YES;
        [_headCollectionView registerClass:[LCYHeadCVCell class] forCellWithReuseIdentifier:@"LCYHeadCVCell"];
        [self addSubview:_headCollectionView];
        [_headCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(64);
            make.height.mas_equalTo(autoScaleH(220));
        }];
    }
    return _headCollectionView;
}

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        [self addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.headCollectionView.mas_bottom).mas_equalTo(8);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(8);
        }];
        _pageControl.currentPageIndicatorTintColor = [LCYColor lcy_currentPageControlIndicatorColor];
        _pageControl.pageIndicatorTintColor = [LCYColor lcy_pageControlIndicatorColor];
    }
    return _pageControl;
}


#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LCYHeadCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LCYHeadCVCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[LCYHeadCVCell alloc] init];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end

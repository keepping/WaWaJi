//
//  LCYHomeView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "LCYHomeView.h"

@implementation LCYHomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self backImageView];
        [self whiteBackView];
        [self contentCollectionView];
    }
    return self;
}

- (UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_bg"]];
        [self addSubview:_backImageView];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(autoScaleH(436));
        }];
    }
    return _backImageView;
}

- (UICollectionView *)contentCollectionView{
    if (_contentCollectionView == nil) {
        
        self.contentLayout = [[UICollectionViewFlowLayout alloc] init];
        self.contentLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.contentLayout.itemSize = CGSizeMake((SCREEN_WIDTH - 75)/2.0, (SCREEN_WIDTH - 72)/2.0);
        self.contentLayout.sectionInset = UIEdgeInsetsMake(18, 30, 18, 30);
        self.contentLayout.minimumLineSpacing = 13;
        self.contentLayout.minimumInteritemSpacing = 13;
        self.contentLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, autoScaleH(250) + 64);

        _contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.contentLayout];
        _contentCollectionView.bounces = YES;
        _contentCollectionView.backgroundColor = [UIColor redColor];
        _contentCollectionView.delegate = self;
        _contentCollectionView.dataSource = self;
        _contentCollectionView.showsVerticalScrollIndicator = NO;
        _contentCollectionView.backgroundColor = [UIColor clearColor];
        [_contentCollectionView registerClass:[LCYHeadScrollView class]  forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LCYHeadScrollView"];
        [_contentCollectionView registerClass:[LCYHomeContentCVCell class] forCellWithReuseIdentifier:@"LCYHomeContentCVCell"];
        [self addSubview:_contentCollectionView];
        [_contentCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
        
        if (@available(iOS 11, *)) {
            if ([_contentCollectionView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
                _contentCollectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }
    }
    return _contentCollectionView;
}

- (UIView *)whiteBackView{
    if (!_whiteBackView) {
        UIView *whiteBackView = [[UIView alloc] initWithFrame:CGRectMake(15, autoScaleH(250) + 64, SCREEN_WIDTH - 30, SCREEN_HEIGHT)];
        whiteBackView.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteBackView];
        _whiteBackView = whiteBackView;
        whiteBackView.layer.cornerRadius = 6.0;
        whiteBackView.layer.masksToBounds = YES;
    }
    return _whiteBackView;
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LCYHomeContentCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LCYHomeContentCVCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[LCYHomeContentCVCell alloc] init];
    }
    
    cell.layer.cornerRadius = 6.0;
    cell.layer.masksToBounds = YES;
    
    return cell;
}

/* 设置顶部视图和底部视图，通过kind参数分辨是设置顶部还是底部 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableview = [[UICollectionReusableView alloc] init];
    
    if (kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LCYHeadScrollView" forIndexPath:indexPath];
        reusableview.userInteractionEnabled = YES;
        reusableview = headerView;
    }
    return reusableview;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY < autoScaleH(250) + 64) {
        CGRect frame = CGRectMake(15, autoScaleH(250) + 64 - offsetY, SCREEN_WIDTH - 30, SCREEN_HEIGHT);
        self.whiteBackView.frame = frame;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _JumpToPlayCallBack(indexPath);
}

@end

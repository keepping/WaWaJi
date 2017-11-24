//
//  LCYHomeView.h
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "BaseView.h"
#import "LCYHeadScrollView.h"
#import "LCYHomeContentCVCell.h"

@interface LCYHomeView : BaseView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) void(^JumpToPlayCallBack)(id obj) ;

@property (nonatomic, strong) UIImageView * backImageView;

@property (nonatomic, strong) LCYHeadScrollView * headScrollView;

@property (nonatomic, strong) UICollectionView * contentCollectionView;
@property (nonatomic) UICollectionViewFlowLayout *contentLayout;

@property (nonatomic, strong) UIView * whiteBackView;

@end

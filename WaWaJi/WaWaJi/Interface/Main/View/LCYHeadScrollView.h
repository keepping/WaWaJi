//
//  LCYHeadScrollView.h
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCYHeadCVCell.h"
#import "LCYScrollFlowLayout.h"

@interface LCYHeadScrollView : UICollectionViewCell<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray * imageArray;

@property (nonatomic, strong) UICollectionView * headCollectionView;
@property (nonatomic) LCYScrollFlowLayout *headLayout;
@property (nonatomic, strong) UIPageControl * pageControl;

@end

//
//  LCYScrollFlowLayout.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "LCYScrollFlowLayout.h"

@implementation LCYScrollFlowLayout

- (void)prepareLayout{
    [super prepareLayout];
    self.itemSize = CGSizeMake(SCREEN_WIDTH - autoScaleW(80), autoScaleH(190));
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = autoScaleW(30);
    self.minimumInteritemSpacing = 0;
    self.sectionInset = UIEdgeInsetsMake(15, 30, 15, 30);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    CGFloat visible_centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width/2;
    
    NSArray *attArr = [super layoutAttributesForElementsInRect:rect];

    for (int i = 0; i < attArr.count; i ++) {
        UICollectionViewLayoutAttributes *att = attArr[i];
        CGFloat distance = ABS(att.center.x - visible_centerX);//距离中心差值的绝对值
        if (distance <= SCREEN_WIDTH/2.0) {
            CGFloat scaleValue = 1 + 0.07*(1-ABS(distance)/(SCREEN_WIDTH/2.0));//缩放系数
            att.transform3D = CATransform3DMakeScale(scaleValue, scaleValue, 0);
        }
    }
    return attArr;
}

@end

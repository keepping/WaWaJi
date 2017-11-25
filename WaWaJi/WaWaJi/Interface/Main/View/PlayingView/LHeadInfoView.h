//
//  LHeadInfoView.h
//  XinHuaHua
//
//  Created by 刘岑颖 on 2017/9/27.
//  Copyright © 2017年 lcy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHeadInfoView : UIView

- (instancetype)initWithFrame:(CGRect)frame andTitlesArray:(NSArray *)titlesArray;

@property (nonatomic, strong) void(^InfoHeadButtonClickCallBack) (NSInteger tag);

@property (nonatomic) NSMutableArray<UIButton *> *titleButtons;
@property (nonatomic) UIView *moveView;

@end

//
//  LCYPlayingView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/23.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYPlayingView.h"

@implementation LCYPlayingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self upButton];
        [self downButton];
        [self leftButton];
        [self rightButton];
        [self countButton];
        [self catchButton];
    }
    return self;
}

- (QMUIButton *)upButton{
    if (!_upButton) {
        _upButton = [[QMUIButton alloc] init];
        [_upButton setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
        [self addSubview:_upButton];
        [_upButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.width.height.mas_equalTo(autoScaleH(63));
            make.centerX.mas_equalTo(autoScaleH(-83));
        }];
    }
    return _upButton;
}

- (QMUIButton *)downButton{
    if (!_downButton) {
        _downButton = [[QMUIButton alloc] init];
        [_downButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [self addSubview:_downButton];
        [_downButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-20);
            make.width.height.mas_equalTo(autoScaleH(63));
            make.centerX.mas_equalTo(autoScaleH(-83));
        }];
    }
    return _downButton;
}

- (QMUIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [[QMUIButton alloc] init];
        [_leftButton setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
        [self addSubview:_leftButton];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.width.height.mas_equalTo(autoScaleH(63));
            make.centerX.mas_equalTo(self.upButton.mas_centerX).mas_equalTo(autoScaleH(-53));
        }];
    }
    return _leftButton;
}

- (QMUIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [[QMUIButton alloc] init];
        [_rightButton setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        [self addSubview:_rightButton];
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.width.height.mas_equalTo(autoScaleH(63));
            make.centerX.mas_equalTo(self.upButton.mas_centerX).mas_equalTo(autoScaleH(53));
        }];
    }
    return _rightButton;
}

- (QMUIButton *)countButton{
    if (!_countButton) {
        _countButton = [[QMUIButton alloc] init];
        [_countButton setBackgroundImage:[UIImage imageNamed:@"Oval 3 Copy 4"] forState:UIControlStateNormal];
        [self addSubview:_countButton];
        [_countButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(-30);
            make.width.height.mas_equalTo(autoScaleH(63));
        }];
        [_countButton setTitle:@"30s" forState:UIControlStateNormal];
        [_countButton setTitleColor:[LCYColor lcy_navColor] forState:UIControlStateNormal];
    }
    return _countButton;
}

- (QMUIButton *)catchButton{
    if (!_catchButton) {
        _catchButton = [[QMUIButton alloc] init];
        [_catchButton setImage:[UIImage imageNamed:@"confirm"] forState:UIControlStateNormal];
        [self addSubview:_catchButton];
        [_catchButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(self.countButton.mas_bottom).mas_equalTo(3);
            make.width.height.mas_equalTo(autoScaleH(114));
        }];
    }
    return _catchButton;
}

@end

//
//  LCYPlayBottomView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/23.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYPlayBottomView.h"

@implementation LCYPlayBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self backImageView];
        [self startButton];
        [self perMoney];
        [self allMoney];
        [self topButton];
    }
    return self;
}

- (UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rectangle 18"]];
        [self addSubview:_backImageView];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
    return _backImageView;
}

- (UIButton *)startButton{
    if (!_startButton) {
        _startButton = [[UIButton alloc] init];
        [_startButton setImage:[UIImage imageNamed:@"waiting"] forState:UIControlStateNormal];
        [self addSubview:_startButton];
        [_startButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(autoScaleW(162));
            make.height.mas_equalTo(autoScaleW(72));
            make.center.mas_equalTo(0);
        }];
    }
    return _startButton;
}

- (UILabel *)perMoney{
    if (!_perMoney) {
        _perMoney = [[UILabel alloc] initWithFont:[LCYFont LCYFont14] textColor:[LCYColor lcy_WhiteTextColor]];
        [self addSubview:_perMoney];
        [_perMoney mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(-9);
            make.left.mas_equalTo(14);
            make.right.mas_equalTo(self.startButton.mas_left).mas_equalTo(-14);
        }];
        _perMoney.text = @"耗币：10币";
    }
    return _perMoney;
}

- (UILabel *)allMoney{
    if (!_allMoney) {
        _allMoney = [[UILabel alloc] initWithFont:[LCYFont LCYFont14] textColor:[LCYColor lcy_WhiteTextColor]];
        [self addSubview:_allMoney];
        [_allMoney mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(9);
            make.left.mas_equalTo(14);
            make.right.mas_equalTo(self.startButton.mas_left).mas_equalTo(-14);
        }];
        _allMoney.text = @"余额：10币";
    }
    return _allMoney;
}

- (QMUIFillButton *)topButton{
    if (!_topButton) {
        _topButton = [[QMUIFillButton alloc] initWithFillColor:[UIColor whiteColor] titleTextColor:[LCYColor lcy_redTextColor]];
        _topButton.titleLabel.font = [LCYFont LCYFont12];
        [self addSubview:_topButton];
        [_topButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(autoScaleW(63));
            make.height.mas_equalTo(autoScaleH(22));
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(autoScaleW(-22));
        }];
        [_topButton setTitle:@"去充值" forState:UIControlStateNormal];
    }
    return _topButton;
}

@end

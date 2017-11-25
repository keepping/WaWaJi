//
//  LCYHomeContentCVCell.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYHomeContentCVCell.h"

@implementation LCYHomeContentCVCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor qmui_colorWithHexString:@"#cccccc"];
        [self contentImageView];
        [self stateButton];
        [self blackView];
        [self titleLabel];
        [self rightLabel];
        [self moneyLabel];
        [self coinImageView];
        
    }
    return self;
}

- (UIImageView *)contentImageView{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dollPlaceholder"]];
        [self addSubview:_contentImageView];
        [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(1);
            make.right.bottom.mas_equalTo(-1);
        }];
        _contentImageView.layer.cornerRadius = 6;
        _contentImageView.layer.masksToBounds = YES;
    }
    return _contentImageView;
}

- (QMUIFillButton *)stateButton{
    if (!_stateButton) {
        _stateButton = [[QMUIFillButton alloc] init];
        [self addSubview:_stateButton];
        [_stateButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(16);
            make.right.mas_equalTo(-7);
            make.top.mas_equalTo(7);
        }];
        [_stateButton setBackgroundImage:[UIImage imageNamed:@"freetime"] forState:UIControlStateNormal];
        [_stateButton setBackgroundImage:[UIImage imageNamed:@"inuse"] forState:UIControlStateSelected];
    }
    return _stateButton;
}

- (UIView *)blackView{
    if (!_blackView) {
        _blackView = [[UIView alloc] init];
        [self addSubview:_blackView];
        [_blackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(autoScaleH(30));
        }];
        _blackView.backgroundColor = [LCYColor lcy_homeBlackColor];
    }
    return _blackView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont12] textColor:[LCYColor lcy_WhiteTextColor]];
        [self.blackView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(8);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _titleLabel;
}

-(UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont12] textColor:[LCYColor lcy_WhiteTextColor]];
        [self.blackView addSubview:_rightLabel];
        [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-8);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(24);
        }];
        _rightLabel.text = @"/次";
    }
    return _rightLabel;
}

- (UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont16] textColor:[LCYColor lcy_coinColor]];
        [self.blackView addSubview:_moneyLabel];
        [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.rightLabel.mas_left).mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
        _moneyLabel.text = @"0";
    }
    return _moneyLabel;
}

- (UIImageView *)coinImageView{
    if (!_coinImageView) {
        _coinImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_gold"]];
        [self.blackView addSubview:_coinImageView];
        [_coinImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(self.moneyLabel.mas_left).mas_equalTo(-2);
            make.width.height.mas_equalTo(10);
        }];
    }
    return _coinImageView;
}

@end

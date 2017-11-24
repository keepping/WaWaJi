//
//  LCYPlayHeadTitleView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/23.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYPlayHeadTitleView.h"

@implementation LCYPlayHeadTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.75];
        [self headImageView];
        [self nameLabel];
        [self stateLabel];
    }
    return self;
}

- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headPlaceHolder"]];
        [self addSubview:_headImageView];
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(35);
        }];
        _headImageView.layer.cornerRadius = 17.5;
        _headImageView.layer.masksToBounds = YES;
    }
    return _headImageView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont14] textColor:[LCYColor lcy_BlackTextColor]];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headImageView.mas_right).mas_equalTo(8);
            make.centerY.mas_equalTo(-8);
            make.right.mas_equalTo(-8);
        }];
        _nameLabel.text = @"nickname";
    }
    return _nameLabel;
}

- (UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont10] textColor:[LCYColor lcy_BlackTextColor]];
        [self addSubview:_stateLabel];
        [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headImageView.mas_right).mas_equalTo(8);
            make.centerY.mas_equalTo(8);
            make.right.mas_equalTo(-8);
        }];
        _stateLabel.text = @"游戏中";
    }
    return _stateLabel;
}

@end

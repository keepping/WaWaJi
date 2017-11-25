//
//  LCYLoginView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/20.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "LCYLoginView.h"

@implementation LCYLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self backImageView];
        [self protocalButton];
        [self loginButton];
    }
    return self;
}

- (UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"log in"]];
        [self addSubview:_backImageView];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
    return _backImageView;
}

- (QMUIButton *)protocalButton{
    if (!_protocalButton) {
        _protocalButton = [[QMUIButton alloc] init];
        [self addSubview:_protocalButton];
        [_protocalButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"登录注册表示同意用户协议及隐私条款" attributes:@{NSForegroundColorAttributeName:[LCYColor lcy_WhiteTextColor],NSFontAttributeName:[LCYFont LCYFont14]}];
        [att addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:NSMakeRange(0, att.length)];
        [_protocalButton setAttributedTitle:att forState:UIControlStateNormal];
    }
    return _protocalButton;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] init];
        [self addSubview:_loginButton];
        [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(self.protocalButton.mas_top).mas_equalTo(0);
            make.width.height.mas_equalTo(150);
        }];
    }
    return _loginButton;
}

@end

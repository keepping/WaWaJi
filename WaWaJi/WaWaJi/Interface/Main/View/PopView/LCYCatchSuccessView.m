//
//  LCYCatchSuccessView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/24.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYCatchSuccessView.h"

@implementation LCYCatchSuccessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [LCYColor lcy_blackClearColor];
        [self setUpInterface];
    }
    return self;
}

- (void)setUpInterface{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup_ship"]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(autoScaleW(329));
        make.height.mas_equalTo(autoScaleH(232));
        make.centerY.mas_equalTo(-80);
    }];
    
    QMUIButton *inviteButton = [[QMUIButton alloc] init];
    [self addSubview:inviteButton];
    [inviteButton setBackgroundImage:[UIImage imageNamed:@"btn_red"] forState:UIControlStateNormal];
    [inviteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(imageView.mas_bottom).mas_equalTo(autoScaleH(30));
        make.width.mas_equalTo(autoScaleW(135));
        make.height.mas_equalTo(autoScaleH(45));
    }];
    [inviteButton setTitle:@"稍候再玩" forState:UIControlStateNormal];
    [inviteButton setTitleColor:[LCYColor lcy_WhiteTextColor] forState:UIControlStateNormal];
    inviteButton.titleLabel.font = [LCYFont LCYFont16];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont16] textColor:[LCYColor lcy_BlackTextColor]];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_left).mas_equalTo(30);
        make.right.mas_equalTo(imageView.mas_right).mas_equalTo(-30);
        make.top.mas_equalTo(imageView.mas_top).mas_equalTo(autoScaleH(150));
    }];
    titleLabel.text = @"恭喜你，成功抓到娃娃！请前往填写收货地址";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;

    self.inviteButton = inviteButton;
}

@end

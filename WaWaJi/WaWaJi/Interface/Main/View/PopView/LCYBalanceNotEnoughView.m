//
//  LCYBalanceNotEnoughView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/24.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYBalanceNotEnoughView.h"

@implementation LCYBalanceNotEnoughView

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
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"popup_cat"]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(autoScaleW(299));
        make.height.mas_equalTo(autoScaleH(232));
        make.centerY.mas_equalTo(-80);
    }];
    
    QMUIButton *closeButton = [[QMUIButton alloc] init];
    [self addSubview:closeButton];
    [closeButton setImage:[UIImage imageNamed:@"popup_close"] forState:UIControlStateNormal];
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(imageView.mas_top).mas_equalTo(0);
        make.width.height.mas_equalTo(autoScaleW(40));
    }];
    
    QMUIButton *inviteButton = [[QMUIButton alloc] init];
    [self addSubview:inviteButton];
    [inviteButton setBackgroundImage:[UIImage imageNamed:@"btn_red"] forState:UIControlStateNormal];
    [inviteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(imageView.mas_bottom).mas_equalTo(autoScaleH(30));
        make.width.mas_equalTo(autoScaleW(135));
        make.height.mas_equalTo(autoScaleH(45));
    }];
    [inviteButton setTitle:@"邀请好友" forState:UIControlStateNormal];
    [inviteButton setTitleColor:[LCYColor lcy_WhiteTextColor] forState:UIControlStateNormal];
    inviteButton.titleLabel.font = [LCYFont LCYFont16];
    
    QMUIButton *topButton = [[QMUIButton alloc] init];
    [self addSubview:topButton];
    [topButton setBackgroundImage:[UIImage imageNamed:@"btn_yello"] forState:UIControlStateNormal];
    [topButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(imageView.mas_right).mas_equalTo(0);
        make.top.mas_equalTo(imageView.mas_bottom).mas_equalTo(autoScaleH(30));
        make.height.mas_equalTo(autoScaleH(45));
        make.width.mas_equalTo(autoScaleW(135));
    }];
    [topButton setTitle:@"前往充值" forState:UIControlStateNormal];
    [topButton setTitleColor:[LCYColor lcy_WhiteTextColor] forState:UIControlStateNormal];
    topButton.titleLabel.font = [LCYFont LCYFont16];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont16] textColor:[LCYColor lcy_BlackTextColor]];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_left).mas_equalTo(15);
        make.right.mas_equalTo(imageView.mas_right).mas_equalTo(-15);
        make.top.mas_equalTo(imageView.mas_top).mas_equalTo(autoScaleH(120));
    }];
    titleLabel.text = @"余额不足";
    titleLabel.textAlignment = NSTextAlignmentCenter;

    UILabel *detailLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont14] textColor:[LCYColor lcy_BlackTextColor]];
    [self addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_left).mas_equalTo(15);
        make.right.mas_equalTo(imageView.mas_right).mas_equalTo(-15);
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_equalTo(autoScaleH(13));
        make.bottom.mas_equalTo(imageView.mas_bottom).mas_equalTo(-10);
    }];
    detailLabel.text = @"您的余额不足，请前往充值或邀请好友赢取游戏币";
    detailLabel.numberOfLines = 0;
    
    self.closeButton = closeButton;
    self.inviteButton = inviteButton;
    self.topButton = topButton;
}

@end

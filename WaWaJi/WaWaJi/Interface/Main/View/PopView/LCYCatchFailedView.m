//
//  LCYCatchFailedView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/24.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYCatchFailedView.h"

@implementation LCYCatchFailedView

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
        make.left.mas_equalTo(imageView.mas_left).mas_equalTo(0);
        make.top.mas_equalTo(imageView.mas_bottom).mas_equalTo(autoScaleH(30));
        make.width.mas_equalTo(autoScaleW(135));
        make.height.mas_equalTo(autoScaleH(45));
    }];
    [inviteButton setTitle:@"稍候再玩" forState:UIControlStateNormal];
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
    [topButton setTitle:@"再来一次" forState:UIControlStateNormal];
    [topButton setTitleColor:[LCYColor lcy_WhiteTextColor] forState:UIControlStateNormal];
    topButton.titleLabel.font = [LCYFont LCYFont16];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont16] textColor:[LCYColor lcy_BlackTextColor]];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_left).mas_equalTo(15);
        make.right.mas_equalTo(imageView.mas_right).mas_equalTo(-15);
        make.top.mas_equalTo(imageView.mas_top).mas_equalTo(autoScaleH(150));
    }];
    titleLabel.text = @"真可惜，未抓到娃娃~是否再来一次？";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;

    UILabel *detailLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont18] textColor:[LCYColor lcy_navColor]];
    [self addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_left).mas_equalTo(15);
        make.right.mas_equalTo(imageView.mas_right).mas_equalTo(-15);
        make.top.mas_equalTo(titleLabel.mas_bottom).mas_equalTo(autoScaleH(3));
        make.bottom.mas_equalTo(imageView.mas_bottom).mas_equalTo(-10);
    }];
    detailLabel.text = @"10(s)";
    detailLabel.textAlignment = NSTextAlignmentCenter;

    self.inviteButton = inviteButton;
    self.topButton = topButton;
}

@end

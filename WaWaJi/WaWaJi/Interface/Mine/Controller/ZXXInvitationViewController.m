//
//  ZXXInvitationViewController.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXInvitationViewController.h"

@interface ZXXInvitationViewController ()

@end

@implementation ZXXInvitationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.title = @"邀请奖励";
}

- (void)initSubviews{
    [super initSubviews];
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, autoScaleH(238))];
    headView.backgroundColor = [LCYColor lcy_redTextColor];
    [self.view addSubview:headView];
    
    UIImageView *bgImageView = [[UIImageView alloc] init];
    bgImageView.image = [UIImage imageNamed:@"invitationbg"];
    [self.view addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(4);
        make.top.offset(64);
        make.right.offset(-4);
        make.height.offset(autoScaleH(344));
    }];
    
    UILabel *tips = [[UILabel alloc] initWithFont:[UIFont fontWithName:@"PingFangSC-Semibold" size:14] textColor:[UIColor blackColor]];
    tips.text = @"我的邀请码";
    [self.view addSubview:tips];
    [tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.offset(64+autoScaleH(167));
    }];
    
    UILabel *number = [[UILabel alloc] initWithFont:[UIFont fontWithName:@"PingFangSC-Semibold" size:50] textColor:[UIColor blackColor]];
    number.text = @"214123132";
    [self.view addSubview:number];
    [number mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(tips.mas_bottom).offset(12);
    }];
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"btn_red"] forState:UIControlStateNormal];
    [self.view addSubview:shareBtn];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    [shareBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(bgImageView.mas_bottom).offset(-20);
        make.size.sizeOffset(CGSizeMake(160, 55));
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImage*)navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:[UIColor clearColor]];
}
@end

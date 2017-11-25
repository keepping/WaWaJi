//
//  ZXXBeInvitatedViewController.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXBeInvitatedViewController.h"

@interface ZXXBeInvitatedViewController ()

@end

@implementation ZXXBeInvitatedViewController

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
    bgImageView.image = [UIImage imageNamed:@"invitationcode"];
    [self.view addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(4);
        make.top.offset(64);
        make.right.offset(-4);
        make.height.offset(autoScaleH(344));
    }];
    
    UILabel *tips = [[UILabel alloc] initWithFont:[UIFont fontWithName:@"PingFangSC-Semibold" size:14] textColor:[UIColor blackColor]];
    tips.text = @"输入好友给你的邀请码";
    [self.view addSubview:tips];
    [tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.offset(64+autoScaleH(167));
    }];
    
    UIImageView *inputBG = [[UIImageView alloc] init];
    inputBG.userInteractionEnabled = YES;
    inputBG.image = [UIImage imageNamed:@"input"];
    [self.view addSubview:inputBG];
    [inputBG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(tips.mas_bottom).offset(19);
        make.size.sizeOffset(CGSizeMake(autoScaleW(243), autoScaleH(50)));
    }];
    QMUITextField *textField = [[QMUITextField alloc] init];
    textField.textInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [inputBG addSubview:textField];
    textField.placeholder = @"请输入正确的邀请码";
    textField.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    UILabel *alertLabel = [[UILabel alloc] initWithFont:[UIFont fontWithName:@"PingFangSC-Semibold" size:12] textColor:[UIColor qmui_colorWithHexString:@"#D0021B"]];
    alertLabel.text = @"请输入正确的邀请码！";
    [self.view addSubview:alertLabel];
    [alertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(inputBG);
        make.top.equalTo(inputBG.mas_bottom).offset(8);
    }];
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"btn_red"] forState:UIControlStateNormal];
    [self.view addSubview:shareBtn];
    [shareBtn setTitle:@"提交" forState:UIControlStateNormal];
    [shareBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(bgImageView.mas_bottom).offset(-20);
        make.size.sizeOffset(CGSizeMake(160, 55));
    }];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImage*)navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:[UIColor clearColor]];
}

@end

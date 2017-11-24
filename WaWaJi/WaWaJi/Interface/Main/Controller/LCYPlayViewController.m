//
//  LCYPlayViewController.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYPlayViewController.h"
#import "LCYPlayHeadTitleView.h"
#import "LCYPlayView.h"
#import "LCYAlertViewController.h"
#import "LCYAddressViewController.h"

@interface LCYPlayViewController ()

@property (nonatomic, strong) LCYPlayHeadTitleView * headTitleView;

@property (nonatomic, strong) LCYPlayView * playView;

@end

@implementation LCYPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [QMUINavigationButton barButtonItemWithImage:UIImageMake(@"topbar_back_yello") position:QMUINavigationButtonPositionLeft target:self action:@selector(goBack)];
    self.navigationItem.rightBarButtonItem = [QMUINavigationButton barButtonItemWithImage:UIImageMake(@"topbar_help") position:QMUINavigationButtonPositionRight target:self action:@selector(helpAction)];
    
    [self.titleView addSubview:self.headTitleView];

    
    [self playView];
    [self allBlock];
    
    [self showPopVCAction:LCYCacheSuccessType];
}

-(void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated{
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.navigationItem.leftBarButtonItem = [QMUINavigationButton barButtonItemWithImage:UIImageMake(@"topbar_back_yello") position:QMUINavigationButtonPositionLeft target:self action:@selector(goBack)];
    self.navigationItem.rightBarButtonItem = [QMUINavigationButton barButtonItemWithImage:UIImageMake(@"topbar_help") position:QMUINavigationButtonPositionRight target:self action:@selector(helpAction)];
    
    [self.titleView addSubview:self.headTitleView];
    [_headTitleView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(35);
    }];
}

- (UIImage*)navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:UIColorMakeWithRGBA(0,0,0,0)];
}

#pragma mark - Methods ------------

-(void)goBack{
    [self pop];
}

- (void)helpAction{
    
}

- (void)allBlock{
    @WeakObj(self);
    [self.playView setNaviChangeCallBack:^(BOOL show) {
        @StrongObj(self);
        if (show == YES) {
            self.navigationController.navigationBar.hidden = YES;
        }else{
            self.navigationController.navigationBar.hidden = NO;
        }
    }];
    
    [self.playView.infoView.headView setInfoHeadButtonClickCallBack:^(NSInteger tag) {
        @StrongObj(self);
        [UIView animateWithDuration:0.1 animations:^{
            self.playView.infoView.scrollView.contentOffset = CGPointMake(tag * (SCREEN_WIDTH - autoScaleW(28)), 0);
        }];
    }];
}

- (void)showPopVCAction:(LCYAlertType)alertType{
    LCYAlertViewController *alertVC = [[LCYAlertViewController alloc] init];
    alertVC.alertType = alertType;
    [self addChildViewController:alertVC];
    [self.view addSubview:alertVC.view];
    [alertVC didMoveToParentViewController:self];
    
    //跳转到填写地址界面
    @WeakObj(self);
    [alertVC setLCYAddressCallBack:^(id obj) {
        @StrongObj(self);
        LCYAddressViewController *vc = [[LCYAddressViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

#pragma mark - LazyLoading -----

- (LCYPlayHeadTitleView *)headTitleView{
    if (!_headTitleView) {
        _headTitleView = [[LCYPlayHeadTitleView alloc] initWithFrame:CGRectMake(-70, -17.5, 140, 35)];
        _headTitleView.layer.cornerRadius = 17.5;
        _headTitleView.layer.masksToBounds = YES;
    }
    return _headTitleView;
}

- (LCYPlayView *)playView{
    if (!_playView) {
        _playView = [[LCYPlayView alloc] init];
        [self.view addSubview:_playView];
        [_playView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
    return _playView;
}

@end

//
//  LCYLoginViewController.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/20.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "LCYLoginViewController.h"
#import "LCYLoginView.h"
#import "LCYWebViewController.h"
#import "LCYHomeViewController.h"
#import "LCYRootNaviViewController.h"

@interface LCYLoginViewController ()

@property (nonatomic, strong) LCYLoginView * loginView;

@end

@implementation LCYLoginViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginView = [[LCYLoginView alloc] init];
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    
    [self.loginView.protocalButton addTarget:self action:@selector(gotoProtocalAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginView.loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
}

-(UIImage*)navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:UIColorMakeWithRGBA(0,0,0,0)];
}

- (void)gotoProtocalAction{
    LCYWebViewController *vc = [[LCYWebViewController alloc] init];
    vc.showUrl = @"https://www.baidu.com";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)loginAction{
    LCYHomeViewController *vc = [[LCYHomeViewController alloc] init];
    LCYRootNaviViewController *navVC = [[LCYRootNaviViewController alloc] initWithRootViewController:vc];
    [UIApplication sharedApplication].keyWindow.rootViewController = navVC;
}

@end

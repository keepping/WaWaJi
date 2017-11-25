//
//  LCYHomeViewController.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/21.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "LCYHomeViewController.h"
#import "LCYHomeView.h"
#import "LCYPlayViewController.h"

@interface LCYHomeViewController ()

@property (nonatomic, strong) LCYHomeView * homeView;

@end

@implementation LCYHomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeView = [[LCYHomeView alloc] init];
    [self.view addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    
    @WeakObj(self);
    [self.homeView setJumpToPlayCallBack:^(id obj) {
        @StrongObj(self);
        [self push:@"LCYPlayViewController"];
    }];
}

- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated{
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.navigationItem.leftBarButtonItem = [QMUINavigationButton barButtonItemWithImage:UIImageMake(@"set") position:QMUINavigationButtonPositionLeft target:self action:@selector(setAction)];
    self.navigationItem.rightBarButtonItem = [QMUINavigationButton barButtonItemWithImage:UIImageMake(@"mydolls") position:QMUINavigationButtonPositionRight target:self action:@selector(presentAction)];
}

- (UIImage*)navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:UIColorMakeWithRGBA(0,0,0,0)];
}

- (void)setAction{
    [self push:@"LCYMineViewController"];
}

- (void)presentAction{
    
}

@end

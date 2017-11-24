//
//  LCYAddressViewController.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/24.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYAddressViewController.h"

@interface LCYAddressViewController ()

@end

@implementation LCYAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated{
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.title = @"个人信息";
    self.navigationItem.rightBarButtonItem = [QMUINavigationButton barButtonItemWithType:QMUINavigationButtonTypeNormal title:@"提交" position:QMUINavigationButtonPositionRight target:self action:@selector(submitAction)];
}

- (void)submitAction{
    
}

@end

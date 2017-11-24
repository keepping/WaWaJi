//
//  LCYAlertViewController.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/24.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYAlertViewController.h"
#import "LCYBalanceNotEnoughView.h"
#import "LCYCatchFailedView.h"
#import "LCYCatchSuccessView.h"

@interface LCYAlertViewController ()

@property (nonatomic, strong) LCYBalanceNotEnoughView * notEnoughView;
@property (nonatomic, strong) LCYCatchFailedView * failedView;
@property (nonatomic, strong) LCYCatchSuccessView * successView;

@end

@implementation LCYAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    
    [self setUpInterface:self.alertType];
    
}

- (void)setUpInterface:(LCYAlertType)type{
    switch (type) {
        case LCYBalanceNotEnoughType:
        {
            self.notEnoughView = [[LCYBalanceNotEnoughView alloc] init];
            [self.view addSubview:self.notEnoughView];
            [self.notEnoughView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.bottom.mas_equalTo(0);
            }];
            [self.notEnoughView.closeButton addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        case LCYCacheFailedType:
        {
            self.failedView = [[LCYCatchFailedView alloc] init];
            [self.view addSubview:self.failedView];
            [self.failedView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.bottom.mas_equalTo(0);
            }];
            [self.failedView.topButton addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        case LCYCacheSuccessType:
        {
            self.successView = [[LCYCatchSuccessView alloc] init];
            [self.view addSubview:self.successView];
            [self.successView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.bottom.mas_equalTo(0);
            }];
            [self.successView.inviteButton addTarget:self action:@selector(addressAction) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
    }
}

- (void)dismissAction{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (void)addressAction{
    [self dismissAction];
    _LCYAddressCallBack(nil);
}

@end

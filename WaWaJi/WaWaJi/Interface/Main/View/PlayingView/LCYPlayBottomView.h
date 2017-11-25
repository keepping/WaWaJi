//
//  LCYPlayBottomView.h
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/23.
//  Copyright © 2017年 james. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCYPlayBottomView : UIView

//等待中
@property (nonatomic, strong) UIImageView * backImageView;

@property (nonatomic, strong) UIButton * startButton;

@property (nonatomic, strong) UILabel * perMoney;

@property (nonatomic, strong) UILabel * allMoney;

@property (nonatomic, strong) QMUIFillButton * topButton;

@end

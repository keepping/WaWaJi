//
//  LCYColor.h
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/21.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCYColor : NSObject

+ (UIColor *)lcy_navColor;

+ (UIColor *)lcy_WhiteTextColor;

+ (UIColor *)lcy_BlackTextColor;

//未选中PageControl颜色
+ (UIColor *)lcy_pageControlIndicatorColor;

//选中pageControl颜色
+ (UIColor *)lcy_currentPageControlIndicatorColor;

//首页cell中黑色背景色
+ (UIColor *)lcy_homeBlackColor;

//金币颜色
+ (UIColor *)lcy_coinColor;

//文字红色
+ (UIColor *)lcy_redTextColor;

//黑色透明背景
+ (UIColor *)lcy_blackClearColor;

@end

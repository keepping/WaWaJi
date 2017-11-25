//
//  LCYColor.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/21.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "LCYColor.h"

@implementation LCYColor

+ (UIColor *)lcy_navColor{
    return [UIColor qmui_colorWithHexString:@"#FF6060"];
}

+ (UIColor *)lcy_WhiteTextColor{
    return [UIColor qmui_colorWithHexString:@"#FFFFFF"];
}

+ (UIColor *)lcy_BlackTextColor{
    return [UIColor qmui_colorWithHexString:@"#000000"];
}

+ (UIColor *)lcy_pageControlIndicatorColor{
    return [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3];
}

+ (UIColor *)lcy_currentPageControlIndicatorColor{
    return [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
}

+ (UIColor *)lcy_homeBlackColor{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
}

+ (UIColor *)lcy_coinColor{
    return [UIColor qmui_colorWithHexString:@"#FBEB5C"];
}

+ (UIColor *)lcy_redTextColor{
    return [UIColor qmui_colorWithHexString:@"#FF5E5F"];
}

+ (UIColor *)lcy_blackClearColor{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
}

@end

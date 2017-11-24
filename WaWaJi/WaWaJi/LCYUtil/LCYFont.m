//
//  LCYFont.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/21.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "LCYFont.h"

@implementation LCYFont

+ (UIFont *)LCYFont18
{
    return  [self fontWithSize:18 weight:UIFontWeightRegular];
}

+ (UIFont *)LCYFont16
{
    return  [self fontWithSize:16 weight:UIFontWeightRegular];
}

+ (UIFont *)LCYFont14
{
    return  [self fontWithSize:14 weight:UIFontWeightRegular];
}

+ (UIFont *)LCYFont12
{
    return  [self fontWithSize:12 weight:UIFontWeightRegular];
}

+ (UIFont *)LCYFont10
{
    return  [self fontWithSize:10 weight:UIFontWeightRegular];
}

+ (UIFont *)fontWithSize:(CGFloat )size weight:(CGFloat)weight
{
    return [UIFont systemFontOfSize:autoScaleW(size) weight:weight];
}

@end

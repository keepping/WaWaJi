//
//  UIControl+clickRepeatedly.m
//  btnClickRepeatedlyDemo
//
//  Created by 段贤才 on 16/7/1.
//  Copyright © 2016年 volientDuan. All rights reserved.
//

#import "UIControl+clickRepeatedly.h"
#import <objc/runtime.h>

static char *ClickIntervalKey;
static char *IgnoreClick;
@implementation UIControl (clickRepeatedly)

- (void)setClickInterval:(NSTimeInterval)clickInterval{
    objc_setAssociatedObject(self, &ClickIntervalKey, @(clickInterval), OBJC_ASSOCIATION_ASSIGN);
}

- (NSTimeInterval)clickInterval{
    
    return [objc_getAssociatedObject(self, &ClickIntervalKey) doubleValue];
}

- (void)setIgnoreClick:(BOOL)ignoreClick{
    objc_setAssociatedObject(self, &IgnoreClick, @(ignoreClick), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)ignoreClick{
    return [objc_getAssociatedObject(self, &IgnoreClick) boolValue];
}

+ (void)load
{
    //替换点击事件
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(rc_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)rc_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.ignoreClick==YES) {
        return;
    }else{
        [self rc_sendAction:action to:target forEvent:event];
    }
    if (self.clickInterval > 0)
    {
        self.ignoreClick = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.clickInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self setIgnoreClick:NO];
        });
    }
}



@end

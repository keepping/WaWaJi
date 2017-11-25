//
//  BaseView.m
//  WaWaJi
//
//  Created by 朱林峰 on 2017/3/1.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=COLOR_BACKGROUND;
//        _topbarview=[[TopBarView alloc] init];
//        [_topbarview setTopBarView_backgroundColor:COLOR_MAIN];
//        [self addSubview:_topbarview];
        
    }
    return self;
}

@end

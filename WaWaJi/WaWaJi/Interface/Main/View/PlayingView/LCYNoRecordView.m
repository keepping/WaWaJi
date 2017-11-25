//
//  LCYNoRecordView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/23.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYNoRecordView.h"

@implementation LCYNoRecordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self imageView];
    }
    return self;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"record"]];
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.width.mas_equalTo(autoScaleW(127));
            make.height.mas_equalTo(autoScaleH(146));
        }];
    }
    return _imageView;
}

@end

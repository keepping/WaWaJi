//
//  LCYHeadCVCell.m
//  BBetter
//
//  Created by 刘岑颖 on 2017/8/1.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "LCYHeadCVCell.h"

@implementation LCYHeadCVCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self contentImageView];
    }
    return self;
}

- (UIImageView *)contentImageView{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholderImage"]];
        [self addSubview:_contentImageView];
        [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.mas_equalTo(0);
        }];
        _contentImageView.layer.cornerRadius = 10;
        _contentImageView.layer.masksToBounds = YES;
    }
    return _contentImageView;
}


@end

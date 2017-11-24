//
//  LHeadInfoView.m
//  XinHuaHua
//
//  Created by 刘岑颖 on 2017/9/27.
//  Copyright © 2017年 lcy. All rights reserved.
//

#import "LHeadInfoView.h"

@interface LHeadInfoView ()

@property (nonatomic, assign) CGFloat leftDistance;

@end

@implementation LHeadInfoView

- (instancetype)initWithFrame:(CGRect)frame andTitlesArray:(NSArray *)titlesArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftDistance = ((SCREEN_WIDTH - 30) - 63 * titlesArray.count) / (titlesArray.count * 2);
        self.backgroundColor = [UIColor clearColor];
        self.titleButtons = [NSMutableArray array];
        for (int i = 0; i < titlesArray.count; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(((SCREEN_WIDTH - 30)/titlesArray.count) * i, 0, (SCREEN_WIDTH - 30)/titlesArray.count, 50)];
            [button setTitle:titlesArray[i] forState:UIControlStateNormal];
            [self addSubview:button];
            [button setTitleColor:[LCYColor lcy_BlackTextColor] forState:UIControlStateNormal];
            [button setTitleColor:[LCYColor lcy_redTextColor] forState:UIControlStateSelected];
            button.tag = 10 + i;
            button.titleLabel.font = [LCYFont LCYFont14];
            [button addTarget:self action:@selector(buttonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0) {
                button.selected = YES;
            }
            [self.titleButtons addObject:button];
        }
        
        [self moveView];
    }
    return self;
}

- (UIView *)moveView{
    if (_moveView == nil) {
        _moveView = [[UIView alloc] initWithFrame:CGRectMake(self.leftDistance, 47, 63, 3)];
        [self addSubview:_moveView];
        _moveView.backgroundColor = [LCYColor lcy_navColor];
        _moveView.layer.cornerRadius = 1.5;
        _moveView.layer.masksToBounds = YES;
    }
    return _moveView;
}

- (void)buttonClickedAction:(UIButton *)button{
    NSInteger i = button.tag - 10;
    for (UIButton *b in self.titleButtons) {
        b.selected = NO;
    }
    button.selected = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.moveView.frame;
        frame.origin.x = self.leftDistance + i * (SCREEN_WIDTH - 30)/(self.titleButtons.count) ;
        self.moveView.frame = frame;
    }];
    _InfoHeadButtonClickCallBack(i);
}

@end

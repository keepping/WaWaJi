//
//  LCYPlayView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYPlayView.h"

@implementation LCYPlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self personsCollectionView];
        
        [self changeCameraButton];
        
        [self bottomView];
        
        [self playingView];
        
        [self infoView];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
        pan.delegate = self;
        
        [self.infoView.upButton addTarget:self action:@selector(doneAction) forControlEvents:UIControlEventTouchUpInside];
        [self.infoView.doneButton addTarget:self action:@selector(upAction) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomView.startButton addTarget:self action:@selector(showPlayingView) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark - methods ----------

- (void)showPlayingView{
    self.playingView.hidden = NO;
    self.bottomView.hidden = YES;
    self.infoView.hidden = YES;
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDownAction) userInfo:nil repeats:YES];
}

- (void)hidePlayingView{
    self.playingView.hidden = YES;
    self.bottomView.hidden = NO;
    self.infoView.hidden = NO;
}

- (void)countDownAction{
    NSString *numberString = [self.playingView.countButton.currentTitle componentsSeparatedByString:@"s"].firstObject;
    NSInteger number = numberString.integerValue;
    number --;
    [self.playingView.countButton setTitle:[NSString stringWithFormat:@"%lds",number] forState:UIControlStateNormal];
    if (number == 0) {
        [self.countDownTimer invalidate];
        [self hidePlayingView];
    }
}

- (void)doneAction{
    _NaviChangeCallBack(NO);
    self.infoView.didShow = NO;
    self.infoView.upButton.hidden = YES;
    self.infoView.doneButton.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.infoView.whiteBackView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
        CGRect frame = CGRectMake(0, SCREEN_HEIGHT - 90, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.infoView.frame = frame;
        self.infoView.backgroundColor = [UIColor clearColor];
    }];
}

- (void)upAction{
    self.infoView.didShow = YES;
    self.infoView.upButton.hidden = NO;
    self.infoView.doneButton.hidden = YES;
    _NaviChangeCallBack(YES);
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.infoView.frame = frame;
        self.infoView.whiteBackView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
        self.infoView.backgroundColor = [LCYColor lcy_navColor];
    }];
}

- (void)panAction:(UIPanGestureRecognizer *)sender{
    
    CGPoint point1 = [sender locationInView:self];
    CGPoint point2 = [sender translationInView:self];
    CGFloat beginY = point1.y - point2.y;

    if (self.infoView.didShow == YES) {
        //隐藏
        //判断起始位置是不是屏幕上方1/4处
        if (beginY < SCREEN_HEIGHT/4.0) {
            CGRect frame = CGRectMake(0,point2.y, SCREEN_WIDTH, SCREEN_HEIGHT);
            self.infoView.frame = frame;
        }
    }else{
        //展示
        //判断点击的初始位置是不是在屏幕下方1/4处
        if (beginY > SCREEN_HEIGHT*3/4.0) {
            CGRect frame = CGRectMake(0, SCREEN_HEIGHT - 90 + point2.y, SCREEN_WIDTH, SCREEN_HEIGHT);
            self.infoView.frame = frame;
        }
    }
    
    if (sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateEnded) {
        if (self.infoView.didShow == YES) {
            //隐藏
            if (beginY < SCREEN_HEIGHT/4.0){
                if (point2.y > 80) {
                    [self doneAction];
                }else{
                    [UIView animateWithDuration:0.1 animations:^{
                        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                        self.infoView.frame = frame;
                    }];
                }
            }
        }else{
            //展示
            if (beginY > SCREEN_HEIGHT*3/4.0){
                if (point2.y < -80) {
                    [self upAction];
                }else{
                    [UIView animateWithDuration:0.1 animations:^{
                        CGRect frame = CGRectMake(0, SCREEN_HEIGHT - 90, SCREEN_WIDTH, SCREEN_HEIGHT);
                        self.infoView.frame = frame;
                    }];
                }
            }
        }
    }
}

#pragma mark - lazy loading --------

- (UICollectionView *)personsCollectionView{
    if (_personsCollectionView == nil) {
        self.personsFlowlayout = [[UICollectionViewFlowLayout alloc] init];
        self.personsFlowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.personsFlowlayout.itemSize = CGSizeMake(34, 34);
        self.personsFlowlayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 27);
        self.personsFlowlayout.minimumLineSpacing = 8;
        self.personsFlowlayout.minimumInteritemSpacing = 8;
        
        _personsCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.personsFlowlayout];
        _personsCollectionView.bounces = YES;
        _personsCollectionView.delegate = self;
        _personsCollectionView.dataSource = self;
        _personsCollectionView.showsHorizontalScrollIndicator = NO;
        _personsCollectionView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [_personsCollectionView registerClass:[LCYHeadCVCell class] forCellWithReuseIdentifier:@"LCYHeadCVCell"];
        [_personsCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

        [self addSubview:_personsCollectionView];
        [_personsCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(22);
            make.top.mas_equalTo(74);
            make.height.mas_equalTo(44);
            make.width.mas_equalTo(188);
        }];
        _personsCollectionView.layer.cornerRadius = 22;
        _personsCollectionView.layer.masksToBounds = YES;
    }
    return _personsCollectionView;
}

- (UIButton *)changeCameraButton{
    if (!_changeCameraButton) {
        _changeCameraButton = [[UIButton alloc] initWithImage:[UIImage imageNamed:@"camera"] title:nil];
        [self addSubview:_changeCameraButton];
        [_changeCameraButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(40);
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-8);
        }];
    }
    return _changeCameraButton;
}

- (LCYPlayBottomView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[LCYPlayBottomView alloc] init];
        [self addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(autoScaleH(177));
        }];
    }
    return _bottomView;
}

- (LCYPlayInfoView *)infoView{
    if (!_infoView) {
        _infoView = [[LCYPlayInfoView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 90, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self addSubview:_infoView];
    }
    return _infoView;
}

- (LCYPlayingView *)playingView{
    if (!_playingView) {
        _playingView = [[LCYPlayingView alloc] init];
        [self addSubview:_playingView];
        [_playingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(autoScaleH(200));
        }];
        _playingView.hidden = YES;
    }
    return _playingView;
}

#pragma mark - UICollectionViewDelegate ------------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item == 0) {
        
        UICollectionViewCell *cell0 = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        if (!cell0) {
            cell0 = [[UICollectionViewCell alloc] init];
        }
        UILabel *label = [[UILabel alloc] initWithFont:[LCYFont LCYFont12] textColor:[LCYColor lcy_WhiteTextColor]];
        label.numberOfLines = 2;
        label.frame = CGRectMake(0, 0, 35, 35);
        label.text = @"100人";
        [cell0 addSubview:label];
        
        return cell0;
    }
    LCYHeadCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LCYHeadCVCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[LCYHeadCVCell alloc] init];
    }
    cell.contentImageView.layer.cornerRadius = 17.5;
    
    return cell;
}

@end

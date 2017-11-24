//
//  LCYPlayView.h
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright © 2017年 james. All rights reserved.
//

#import "BaseView.h"
#import "LCYHeadCVCell.h"
#import "LCYPlayBottomView.h"
#import "LCYPlayInfoView.h"
#import "LCYPlayingView.h"

@interface LCYPlayView : BaseView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate>

@property (nonatomic, strong) void(^NaviChangeCallBack) (BOOL show);

@property (nonatomic, strong) UICollectionView * personsCollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout * personsFlowlayout;

@property (nonatomic, strong) UIButton * changeCameraButton;

@property (nonatomic, strong) UIImageView * backImageView;
@property (nonatomic, strong) LCYPlayBottomView * bottomView;

@property (nonatomic, strong) LCYPlayInfoView * infoView;

@property (nonatomic, strong) LCYPlayingView * playingView;

@property (nonatomic, strong) NSTimer * countDownTimer;

@end

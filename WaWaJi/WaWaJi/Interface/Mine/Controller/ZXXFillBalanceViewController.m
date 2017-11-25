//
//  ZXXFillBalanceViewController.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXFillBalanceViewController.h"
#import "ZXXFillCardCollectionViewCell.h"
@interface ZXXFillBalanceViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong) UILabel *bonusCount;
@end

@implementation ZXXFillBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    if (self.navigationItem.rightBarButtonItem==nil) {
        self.navigationItem.rightBarButtonItem = [QMUINavigationButton barButtonItemWithImage:[UIImage imageNamed:@"me_account"] position:-1 target:self action:@selector(setUptapNavigationBarRightItemWithEvent)];
    }
}
- (void)setUptapNavigationBarRightItemWithEvent{
    [self push:@"ZXXOrderViewController"];
}
- (void)initSubviews {
    [super initSubviews];
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 146)];
    headView.backgroundColor = [UIColor qmui_colorWithHexString:@"#FF758C"];
    [self.view addSubview:headView];
    
    UIView *leftbonusView = [[UIView alloc] init];
    leftbonusView.backgroundColor = [UIColor whiteColor];
    leftbonusView.layer.cornerRadius = 9;
    [self.view addSubview:leftbonusView];
    
    UILabel *bonusCount = [[UILabel alloc] initWithFont:[UIFont fontWithName:@"PingFangSC-Semibold" size:46] textColor:[LCYColor lcy_BlackTextColor]];
    bonusCount.text = @"0.00";
    bonusCount.textAlignment = NSTextAlignmentCenter;
    UILabel *bonusTips = [[UILabel alloc] initWithFont:[UIFont fontWithName:@"PingFangSC-Regular" size:14] textColor:[LCYColor lcy_BlackTextColor]];
    bonusTips.text = @"我的余额";
    [leftbonusView addSubview:bonusCount];
    _bonusCount = bonusCount;
    [leftbonusView addSubview:bonusTips];
    
    [leftbonusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(71);
        make.centerX.equalTo(self.view);
        make.size.sizeOffset(CGSizeMake(autoScaleW(277), 98));
    }];
    [bonusCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.centerX.equalTo(leftbonusView);
        make.size.sizeOffset(CGSizeMake(autoScaleW(200), 65));
    }];
    [bonusTips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-10);
        make.centerX.equalTo(leftbonusView);
    }];
    
    ///////////////////////////////////////////////////////////////////////////////////////
    
    UICollectionViewFlowLayout *layouter = [[UICollectionViewFlowLayout alloc] init];
    
    layouter.minimumLineSpacing = autoScaleH(17);
    layouter.minimumInteritemSpacing = autoScaleW(17);
    int row = 2;
    CGFloat wirth = (SCREEN_WIDTH - autoScaleW(67) - 28)/row;
    layouter.itemSize = CGSizeMake(wirth, autoScaleH(146));
    layouter.sectionInset = UIEdgeInsetsMake(autoScaleH(17), autoScaleW(25), autoScaleH(17), autoScaleW(25));
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layouter];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.layer.cornerRadius = 6;
    collectionView.layer.masksToBounds = YES;
    collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[ZXXFillCardCollectionViewCell class] forCellWithReuseIdentifier:@"ZXXFillCardCollectionViewCellID"];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(leftbonusView.mas_bottom).offset(16);
        make.left.offset(14);
        make.right.offset(-14);
        make.bottom.offset(-10);
    }];
}

#pragma mark - collectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ZXXFillCardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZXXFillCardCollectionViewCellID" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImage*)navigationBarBackgroundImage{
    
    return [UIImage qmui_imageWithColor:[UIColor clearColor]];
    
}
@end

//
//  LCYMineViewController.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/22.
//  Copyright ©  2017年 lcying. All rights reserved.
//

#import "LCYMineViewController.h"

@interface LCYMineViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic, strong) UIImageView *naviIcon;
@property(nonatomic, strong) UIView *naviIconView;
@end

@implementation LCYMineViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
            self.edgesForExtendedLayout = UIRectEdgeTop;
        }
        self.navigationController.navigationBar.translucent = NO;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark - method
- (void)setUpEditButtonWithEvent{
    [self push:@"ZXXEditViewController"];
}
- (void)initTableView{
    [super initTableView];
    // 设置头部视图
    [self setHeadView];
    [self setFootView];
    [self setUpGroup1];
    [self setUpGroup2];
    [self setUpGroup3];
    [self setUpGroup4];
    [self setUpGroup5];
}
-(void)setHeadView{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, autoScaleH(186))];
    UIImageView *bgImageV =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pc_bg"]];
    [headView addSubview:bgImageV];
    [bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(autoScaleW(16), autoScaleH(80), autoScaleH(80), autoScaleH(80))];
    iconView.backgroundColor = [UIColor whiteColor];
    iconView.layer.cornerRadius = autoScaleH(40);
    iconView.layer.masksToBounds = YES;
    [headView addSubview:iconView];
    
    UIImageView *headIcon = [[UIImageView alloc] init];
    headIcon.image = [UIImage imageNamed:@"headPlaceHolder"];
    headIcon.layer.cornerRadius = autoScaleH(38);
    headIcon.layer.masksToBounds = YES;
    [iconView addSubview:headIcon];
    [headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(autoScaleH(2), autoScaleH(2), autoScaleH(2), autoScaleH(2)));
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"name";
    nameLabel.font = [LCYFont LCYFont18];
    nameLabel.textColor = [LCYColor lcy_WhiteTextColor];
    [headView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(autoScaleH(98));
        make.left.offset(autoScaleW(30)+autoScaleH(80));
    }];
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editButton setBackgroundImage:[UIImage imageNamed:@"pc_edit"] forState:UIControlStateNormal];
    [headView addSubview:editButton];
    [editButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel.mas_right).offset(20);
        make.centerY.equalTo(nameLabel);
        make.size.sizeOffset(CGSizeMake(20, 20));
    }];
    [editButton addTarget:self action:@selector(setUpEditButtonWithEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView setTableHeaderView:headView];
}
- (void)setFootView{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    footView.backgroundColor = [UIColor clearColor];
    UIButton *loginOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [footView addSubview:loginOutButton];
    [loginOutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    loginOutButton.backgroundColor = [UIColor whiteColor];
    [loginOutButton setTitleColor:[LCYColor lcy_BlackTextColor] forState:UIControlStateNormal];
    [loginOutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.left.right.equalTo(footView);
        make.height.offset(50);
    }];
    
    [self.tableView setTableFooterView:footView];
}
// 我的余额 游戏记录
- (void)setUpGroup1{
    @WeakObj(self);
    ZXXLabelArrowItem *leftbounes = [ZXXLabelArrowItem itemWithTitle:@"我的余额" rightTitle:@"充值" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXLabelArrowItem * _Nullable item) {
        @StrongObj(self);
        [self push:@"ZXXFillBalanceViewController"];
    }];
    ZXXArrowItem *gameRecoder = [ZXXArrowItem itemWithTitle:@"游戏记录" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXArrowItem * _Nullable item) {
        @StrongObj(self);
        [self push:@"ZXXRecoderViewController"];
    }];
    ZXXGroupItem *group = [[ZXXGroupItem alloc]init];
    group.items = @[leftbounes,gameRecoder];
    [self.groups addObject:group];
}
// 消息中心
- (void)setUpGroup2{
    @WeakObj(self);
    ZXXArrowItem *message = [ZXXArrowItem itemWithTitle:@"消息中心" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXArrowItem * _Nullable item) {
        @StrongObj(self);
        [self push:@"ZXXMessageViewController"];
    }];
    ZXXGroupItem *group = [[ZXXGroupItem alloc]init];
    group.items = @[message];
    [self.groups addObject:group];
}
// 邀请奖励 请输入邀请码
- (void)setUpGroup3{
    @WeakObj(self);
    ZXXArrowItem *invatede = [ZXXArrowItem itemWithTitle:@"邀请奖励" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXArrowItem * _Nullable item) {
        @StrongObj(self);
        [self push:@"ZXXInvitationViewController"];
    }];
    ZXXArrowItem *inputCode = [ZXXArrowItem itemWithTitle:@"请输入邀请码" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXArrowItem * _Nullable item) {
        @StrongObj(self);
        [self push:@"ZXXBeInvitatedViewController"];
    }];
    ZXXGroupItem *group = [[ZXXGroupItem alloc]init];
    group.items = @[invatede,inputCode];
    [self.groups addObject:group];
}
// 背景音乐 背景音效
- (void)setUpGroup4{
    @WeakObj(self);
    ZXXSwitchItem *backMussic = [ZXXSwitchItem itemWithTitle:@"背景音乐" on:YES WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXSwitchItem * _Nullable item) {
        
    }];
    ZXXSwitchItem *backYinxiao = [ZXXSwitchItem itemWithTitle:@"背景音效" on:YES WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXSwitchItem * _Nullable item) {
        
    }];
    ZXXGroupItem *group = [[ZXXGroupItem alloc]init];
    group.items = @[backMussic,backYinxiao];
    [self.groups addObject:group];
}
// 联系客服 问题反馈 关于我们
- (void)setUpGroup5{
    @WeakObj(self);
    ZXXArrowItem *onlineService = [ZXXArrowItem itemWithTitle:@"联系客服" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXArrowItem * _Nullable item) {
        
    }];
    ZXXArrowItem *feedback = [ZXXArrowItem itemWithTitle:@"问题反馈" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXArrowItem * _Nullable item) {
        @StrongObj(self);
        [self push:@"ZXXFeedBackViewController"];
    }];
    ZXXArrowItem *aboutUs = [ZXXArrowItem itemWithTitle:@"关于我们" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXArrowItem * _Nullable item) {
        @StrongObj(self);
        [self push:@"ZXXAboutUsViewController"];
    }];
    ZXXGroupItem *group = [[ZXXGroupItem alloc]init];
    group.items = @[onlineService,feedback,aboutUs];
    [self.groups addObject:group];
}
#pragma mark - tableView delegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }else{
        return [super tableView:tableView heightForHeaderInSection:section];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat alpha = scrollView.contentOffset.y/autoScaleH(100);
    if (alpha<=1) {
        [self setNaViBarWithAlpha:alpha];
    }else{
        [self setNaViBarWithAlpha:1.0];
    }
}
- (void)setNaViBarWithAlpha:(CGFloat)alpha{
    if (self.titleView.title==nil) {
        self.titleView.title = @"name";
    }
    if (_naviIcon==nil) {
        _naviIconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        _naviIconView.backgroundColor = [UIColor whiteColor];
        _naviIconView.layer.cornerRadius = 15;
        _naviIconView.layer.masksToBounds = YES;
        _naviIcon = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 30, 30)];
        [_naviIconView addSubview:_naviIcon];
        _naviIcon.layer.cornerRadius = 15;
        _naviIcon.layer.masksToBounds = YES;
        _naviIcon.image = [UIImage imageNamed:@"headPlaceHolder"];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_naviIconView];
    }
    self.naviIcon.alpha = alpha;
    self.naviIconView.alpha = alpha;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage qmui_imageWithColor:[UIColor colorWithRed:0.92 green:0.47 blue:0.45 alpha:alpha]] forBarMetrics:UIBarMetricsDefault];
    self.titleView.tintColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:alpha];
}
#pragma mark - 设置导航栏
- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    
}
-(UIColor*)navigationBarTintColor{
    return UIColorBlue;
}

-(UIImage*)navigationBarBackgroundImage{
    CGFloat alpha = self.tableView.contentOffset.y/autoScaleH(100);
    return [UIImage qmui_imageWithColor:[UIColor colorWithRed:0.92 green:0.47 blue:0.45 alpha:alpha]];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    CGFloat alpha = self.tableView.contentOffset.y/autoScaleH(100);
    self.titleView.tintColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:alpha];
    self.naviIconView.alpha = alpha;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage qmui_imageWithColor:[UIColor colorWithRed:0.92 green:0.47 blue:0.45 alpha:1]] forBarMetrics:UIBarMetricsDefault];
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer
                                      *)gestureRecognizer{
    return NO; //YES：允许右滑返回  NO：禁止右滑返回
}
- (BOOL)shouldCustomNavigationBarTransitionWhenPopAppearing{
    return YES;
}
@end

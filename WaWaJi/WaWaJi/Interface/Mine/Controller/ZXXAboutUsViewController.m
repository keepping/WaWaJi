//
//  ZXXAboutUsViewController.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXAboutUsViewController.h"

@interface ZXXAboutUsViewController ()

@end

@implementation ZXXAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.title = @"关于我们";
    
}
- (void)initTableView{
    [super initTableView];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.96 green:0.97 blue:0.98 alpha:1.00];
    [self setUpheader];
    [self setUpGroup];
}
- (void)setUpheader{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, autoScaleH(180))];
    UIImageView *icon = [[UIImageView alloc] init];
    icon.image = [UIImage qmui_imageWithColor:[UIColor blueColor]];
    [headView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headView);
        make.size.sizeOffset(CGSizeMake(autoScaleH(110), autoScaleH(110)));
    }];
    [self.tableView setTableHeaderView:headView];
    
}
- (void)setUpGroup{
    @WeakObj(self);
    ZXXArrowItem *userProtocol = [ZXXArrowItem itemWithTitle:@"用户协议" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXArrowItem * _Nullable item) {
        
    }];
    ZXXGroupItem *group = [[ZXXGroupItem alloc]init];
    group.items = @[userProtocol];
    [self.groups addObject:group];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
@end

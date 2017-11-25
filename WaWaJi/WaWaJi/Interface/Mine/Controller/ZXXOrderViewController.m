//
//  ZXXOrderViewController.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXOrderViewController.h"
#import "ZXXGameRecordTableViewCell.h"
@interface ZXXOrderViewController ()
@property(nonatomic, strong) UIView *noOrderView;
@end

@implementation ZXXOrderViewController
- (UIView *)noOrderView{
    if (_noOrderView==nil) {
        _noOrderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        UIImageView *iamge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"norecord"]];
        [_noOrderView addSubview:iamge];
        [iamge mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.top.offset(118);
        }];
        UILabel *tips = [[UILabel alloc] init];
        tips.text = @"暂无记录";
        [_noOrderView addSubview:tips];
        tips.font = [LCYFont LCYFont14];
        tips.textColor = [UIColor qmui_colorWithHexString:@"#9B9B9B"];
        [tips mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iamge.mas_bottom).offset(14);
            make.centerX.offset(0);
        }];
    }
    return _noOrderView;
}
- (void)showNoOrderView{
    [self.view addSubview:self.noOrderView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self showNoOrderView];
}
- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.title = @"账单";
}
- (void)initTableView{
    [super initTableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (UITableViewCell *)tableView:(__kindof UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   ZXXGameRecordTableViewCell *cell = [ZXXGameRecordTableViewCell cellTableView:tableView reuseIdentifier:@"ZXXGameRecordTableViewCellID"];
    cell.status.text = @"+100";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

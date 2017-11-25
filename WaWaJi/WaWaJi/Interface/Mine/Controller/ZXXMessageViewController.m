//
//  ZXXMessageViewController.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXMessageViewController.h"
#import "ZXXMessageTableViewCell.h"
@interface ZXXMessageViewController ()

@end

@implementation ZXXMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.title = @"消息中心";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 87;
}

- (UITableViewCell *)tableView:(__kindof UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXXMessageTableViewCell *cell = [ZXXMessageTableViewCell cellTableView:tableView reuseIdentifier:@"ZXXMessageTableViewCellID"];
    cell.textLabel.text = @"系统通知";
    cell.detailTextLabel.text = @"恭喜您注册成功，成功领取60币...";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

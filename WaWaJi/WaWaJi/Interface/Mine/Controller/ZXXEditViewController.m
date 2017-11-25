//
//  ZXXEditViewController.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/24.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXEditViewController.h"

@interface ZXXEditViewController ()

@end

@implementation ZXXEditViewController

- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.title = @"个人资料";
}
- (void)initTableView{
    [super initTableView];
    [self setUpGroup];
}
- (void)setUpGroup{
    @WeakObj(self);
    ZXXImageArrowItem *icon = [ZXXImageArrowItem itemWithTitle:@"头像" rightImage:[UIImage imageNamed:@"headPlaceHolder"] WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        attribute.circular_clips = YES;
        attribute.rightImageSize = CGSizeMake(50, 50);
    } cellHeight:100 WithOption:^(ZXXImageArrowItem * _Nullable item) {
        
        
    }];
    ZXXLabelArrowItem *name = [ZXXLabelArrowItem itemWithTitle:@"昵称" rightTitle:@"name" WithAttribute:^(ZXXAttributeItem * _Nullable attribute) {
        
    } cellHeight:50 WithOption:^(ZXXLabelArrowItem * _Nullable item) {
        @StrongObj(self);
        @WeakObj(self,item);
        void (^popBlock)(NSString *) = ^(NSString *name) {
            @StrongObj(self,item);
            item.rightTitle = name;
            [self.tableView reloadData];
        };
        [self pushWithData:@"ZXXEditNameViewController" Data:@{@"name":item.rightTitle,@"block":popBlock}];
    }];
    ZXXGroupItem *group = [[ZXXGroupItem alloc]init];
    group.items = @[icon,name];
    [self.groups addObject:group];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.0;
    }else{
        return [super tableView:tableView heightForHeaderInSection:section];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

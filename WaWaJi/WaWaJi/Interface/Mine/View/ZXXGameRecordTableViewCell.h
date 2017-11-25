//
//  ZXXGameRecordTableViewCell.h
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>

@interface ZXXGameRecordTableViewCell : QMUITableViewCell
@property(nonatomic, weak) UIView *contentV;
@property(nonatomic, weak) UIImageView *icon;
@property(nonatomic, weak) UILabel *name;
@property(nonatomic, weak) UILabel *created;
@property(nonatomic, weak) UILabel *status;
+ (instancetype)cellTableView:(QMUITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;
@end

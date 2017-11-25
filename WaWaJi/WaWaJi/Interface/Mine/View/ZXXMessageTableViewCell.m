//
//  ZXXMessageTableViewCell.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXMessageTableViewCell.h"
@interface ZXXMessageTableViewCell()
@property(nonatomic, strong) UILabel *created;
@end
@implementation ZXXMessageTableViewCell

+ (instancetype)cellTableView:(QMUITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier{
    ZXXMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[self alloc] initForTableView:tableView withStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsMake(0, 14, 0, 0);
    }
    return cell;
}

- (instancetype)initForTableView:(QMUITableView *)tableView withStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initForTableView:tableView withStyle:style reuseIdentifier:reuseIdentifier];
    
    self.textLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];
    
    self.detailTextLabel.font = [LCYFont LCYFont14];
    
    UILabel *created = [[UILabel alloc] init];
    created.text = @"2017年10月1日";
    [self.contentView addSubview:created];
    created.font = [LCYFont LCYFont12];
    created.textColor = [UIColor qmui_colorWithHexString:@"#9B9B9B"];
    self.created = created;
    
    self.textLabelEdgeInsets = UIEdgeInsetsMake(-3, 0, 3, 0);
    self.detailTextLabelEdgeInsets = UIEdgeInsetsMake(3, 0, -3, 0);
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.created makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-14);
        make.top.offset(15);
    }];
}

@end

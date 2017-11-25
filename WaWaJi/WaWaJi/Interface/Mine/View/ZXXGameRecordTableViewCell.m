//
//  ZXXGameRecordTableViewCell.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXGameRecordTableViewCell.h"
@interface ZXXGameRecordTableViewCell()

//@property(nonatomic, weak) UIView *contentV;
//@property(nonatomic, weak) UIImageView *icon;
//@property(nonatomic, weak) UILabel *name;
//@property(nonatomic, weak) UILabel *created;
//@property(nonatomic, weak) UILabel *status;

@end
@implementation ZXXGameRecordTableViewCell
+ (instancetype)cellTableView:(QMUITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier{
    ZXXGameRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[self alloc] initForTableView:tableView withStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0);
    }
    return cell;
}

- (instancetype)initForTableView:(QMUITableView *)tableView withStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initForTableView:tableView withStyle:style reuseIdentifier:reuseIdentifier];
    
    UIView *contentV = [[UIView alloc] init];
    contentV.backgroundColor = [UIColor whiteColor];
    contentV.layer.cornerRadius = 6;
    contentV.layer.shadowOffset = CGSizeMake(0, 2);
    contentV.layer.shadowOpacity = 1;
    contentV.layer.shadowRadius = 4;
    contentV.layer.shadowColor = [UIColor qmui_colorWithHexString:@"#CACACA"].CGColor;
    [self.contentView addSubview:contentV];
    self.contentV = contentV;
    
    UIImageView *icon = [[UIImageView alloc] init];
    [self.contentV addSubview:icon];
    icon.image = [UIImage imageNamed:@"room"];
    self.icon = icon;
    
    UILabel *name = [[UILabel alloc] init];
    name.text = @"可爱小熊";
    [self.contentV addSubview:name];
    name.font = [LCYFont LCYFont14];
    name.textColor = [LCYColor lcy_BlackTextColor];
    self.name = name;
    
    UILabel *created = [[UILabel alloc] init];
    created.text = @"2017年10月1日";
    [self.contentV addSubview:created];
    created.font = [LCYFont LCYFont12];
    created.textColor = [UIColor qmui_colorWithHexString:@"#9B9B9B"];
    self.created = created;
    
    UILabel *status = [[UILabel alloc] init];
    status.text = @"成功";
    [self.contentV addSubview:status];
    status.font = [LCYFont LCYFont12];
    status.textColor = [UIColor qmui_colorWithHexString:@"#FF5E5F"];
    self.status = status;
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(5, 14, 5, 14));
    }];
    
    [self.icon makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentV).offset(10);
        make.top.equalTo(self.contentV).offset(12);
        make.size.sizeOffset(CGSizeMake(21, 21));
    }];
    [self.name makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(9);
        make.top.equalTo(self.contentV).offset(13);
    }];
    
    [self.created makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name);
        make.top.equalTo(self.name.mas_bottom).offset(3);
    }];
    
    [self.status makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentV).offset(-14);
        make.centerY.equalTo(self.contentV);
    }];
}
@end

//
//  LCYPlayRecordCell.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/23.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYPlayRecordCell.h"

@implementation LCYPlayRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self headImageView];
        [self timeLabel];
        [self nameLabel];
    }
    return self;
}

- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholderImage"]];
        [self addSubview:_headImageView];
        [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.centerY.mas_equalTo(0);
            make.width.height.mas_equalTo(autoScaleH(30));
        }];
        _headImageView.layer.cornerRadius = autoScaleH(15);
        _headImageView.layer.masksToBounds = YES;
    }
    return _headImageView;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont14] textColor:[LCYColor lcy_BlackTextColor]];
        [self addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-14);
        }];
        _timeLabel.text = @"10分钟前";
    }
    return _timeLabel;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFont:[LCYFont LCYFont14] textColor:[LCYColor lcy_BlackTextColor]];
        [self addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(_headImageView.mas_right).mas_equalTo(14);
        }];
        _nameLabel.text = @"用户名哈哈哈哈哈哈";
    }
    return _nameLabel;
}

@end

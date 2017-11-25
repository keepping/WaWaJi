//
//  ZXXFillCardCollectionViewCell.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/25.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXFillCardCollectionViewCell.h"
@interface ZXXFillCardCollectionViewCell ()
@property(nonatomic, strong) UIImageView *imageView;

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UILabel *presented;

@property(nonatomic, strong) UILabel *detailLabel;

@property(nonatomic, strong) QMUIFillButton *purchase;
@end
@implementation ZXXFillCardCollectionViewCell
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"充值_gold"];
        self.backgroundColor = UIColorWhite;
        self.layer.cornerRadius = 6;
        self.layer.shadowOffset = CGSizeMake(0, 4);
        self.layer.shadowRadius = 4;
        self.layer.shadowOpacity = 0.1;
        self.layer.borderColor = [UIColor qmui_colorWithHexString:@"#FDCD3D"].CGColor;
        self.layer.borderWidth = 2;
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"100币";
        _titleLabel.font = [LCYFont LCYFont14];
        _titleLabel.textColor = UIColorFromRGB(0x000000);
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)presented{
    if (_presented == nil) {
        _presented = [[UILabel alloc] init];
        _presented.text = @"+10";
        _presented.font = [LCYFont LCYFont14];
        _presented.textColor = [LCYColor lcy_redTextColor];
        [self.contentView addSubview:_presented];
    }
    return _presented;
}

- (UILabel *)detailLabel{
    if (_detailLabel == nil) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.text = @"充值10返100币";
        _detailLabel.font = [LCYFont LCYFont14];
        _detailLabel.textColor = COLOR_MAIN;
        [self.contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (QMUIFillButton *)purchase{
    if (_purchase == nil) {
        _purchase = [[QMUIFillButton alloc] initWithFillColor:COLOR_MAIN titleTextColor:UIColorWhite];
        [self.contentView addSubview:_purchase];
        [_purchase setTitle:@"¥10.00" forState:UIControlStateNormal];
    }
    return _purchase;
}

//- (void)setItem:(GoodsItem *)item{
//    _item = item;
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl] placeholderImage:[UIImage qmui_imageWithColor:UIColorGray size:CGSizeMake(163, 160) cornerRadius:0]];
//
//    self.titleLabel.text = item.title;
//    self.money.text = [item.value stringValue];
//
//}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(autoScaleW(12));
        make.top.offset(autoScaleH(24));
        make.size.sizeOffset(CGSizeMake(20, 20));
    }];
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView.mas_right).offset(autoScaleW(8));
        make.centerY.equalTo(self.imageView);
    }];
    
    [self.presented makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel);
        make.left.equalTo(self.titleLabel.mas_right);
    }];
    
    [self.detailLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(autoScaleW(12));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(4);
    }];
    
    [self.purchase makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-autoScaleH(30));
        make.size.sizeOffset(CGSizeMake(autoScaleW(82), autoScaleH(30)));
    }];
}
@end

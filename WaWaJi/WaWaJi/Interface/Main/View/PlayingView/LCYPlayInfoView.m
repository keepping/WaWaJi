//
//  LCYPlayInfoView.m
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/23.
//  Copyright © 2017年 james. All rights reserved.
//

#import "LCYPlayInfoView.h"

@implementation LCYPlayInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.didShow = NO;
        
        [self upButton];
        
        [self whiteBackView];
        
        [self headView];
        
        [self doneButton];
        
        [self scrollView];
        
        [self recordsTableView];
        
        [self webView];
    }
    return self;
}

- (UIButton *)upButton{
    if (!_upButton) {
        _upButton = [[UIButton alloc] init];
        _upButton.hidden = YES;
        [self addSubview:_upButton];
        [_upButton setImage:[UIImage imageNamed:@"playUp"] forState:UIControlStateNormal];
        [_upButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(25);
            make.top.mas_equalTo(28);
        }];
    }
    return _upButton;
}

- (UIView *)whiteBackView{
    if (!_whiteBackView) {
        _whiteBackView = [[UIView alloc] init];
        [self addSubview:_whiteBackView];
        [_whiteBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.upButton.mas_bottom).mas_equalTo(0);
            make.left.mas_equalTo(autoScaleW(14));
            make.right.mas_equalTo(autoScaleW(-14));
            make.bottom.mas_equalTo(autoScaleH(-30));
        }];
        _whiteBackView.layer.cornerRadius = 6.0;
        _whiteBackView.layer.masksToBounds = YES;
        _whiteBackView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    }
    return _whiteBackView;
}

- (LHeadInfoView *)headView{
    if (!_headView) {
        _headView = [[LHeadInfoView alloc] initWithFrame:CGRectZero andTitlesArray:@[@"娃娃详情",@"最近抓中记录"]];
        [self.whiteBackView addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
    }
    return _headView;
}

- (UIButton *)doneButton{
    if (!_doneButton) {
        _doneButton = [[UIButton alloc] init];
        [self addSubview:_doneButton];
        [_doneButton setImage:[UIImage imageNamed:@"pulldown"] forState:UIControlStateNormal];
        [_doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(25);
            make.top.mas_equalTo(self.whiteBackView.mas_top).mas_equalTo(0);
        }];
    }
    return _doneButton;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        [self.whiteBackView addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(self.headView.mas_bottom).mas_equalTo(0);
        }];
        _scrollView.contentSize = CGSizeMake(2*(SCREEN_WIDTH - autoScaleW(28)), 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = NO;
    }
    return _scrollView;
}

- (UITableView *)recordsTableView{
    if (!_recordsTableView) {
        _recordsTableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - autoScaleW(28), 0, SCREEN_WIDTH - autoScaleW(28), SCREEN_HEIGHT - 103 - autoScaleH(30)) style:UITableViewStylePlain];
        [self.scrollView addSubview:_recordsTableView];
        _recordsTableView.delegate = self;
        _recordsTableView.dataSource = self;
        [_recordsTableView registerClass:[LCYPlayRecordCell class] forCellReuseIdentifier:@"LCYPlayRecordCell"];
    }
    return _recordsTableView;
}

- (LCYNoRecordView *)noRecordView{
    if (!_noRecordView) {
        _noRecordView = [[LCYNoRecordView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - autoScaleW(28), 0, SCREEN_WIDTH - autoScaleW(28), SCREEN_HEIGHT - 103 - autoScaleH(30))];
        [self.scrollView addSubview:_noRecordView];
    }
    return _noRecordView;
}

- (WKWebView *)webView{
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = [WKUserContentController new];
        WKPreferences *preferences = [WKPreferences new];
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
        configuration.preferences = preferences;
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - autoScaleW(28), SCREEN_HEIGHT - 103 - autoScaleH(30)) configuration:configuration];
        [self.scrollView addSubview:_webView];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    }
    return _webView;
}

#pragma mark - UITableViewDelegate ----

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCYPlayRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LCYPlayRecordCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[LCYPlayRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LCYPlayRecordCell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return autoScaleH(50);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

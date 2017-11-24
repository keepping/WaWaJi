//
//  LCYPlayInfoView.h
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/23.
//  Copyright © 2017年 james. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHeadInfoView.h"
#import "LCYPlayRecordCell.h"
#import <WebKit/WebKit.h>
#import "LCYNoRecordView.h"

@interface LCYPlayInfoView : UIView <UITableViewDelegate, UITableViewDataSource>

//判断当前界面是不是展示
@property (nonatomic) BOOL didShow;

@property (nonatomic, strong) UIButton * upButton;

@property (nonatomic, strong) UIButton * doneButton;

@property (nonatomic, strong) UIView * whiteBackView;

@property (nonatomic, strong) LHeadInfoView * headView;

@property (nonatomic, strong) UIScrollView * scrollView;

@property (nonatomic, strong) WKWebView * webView;

@property (nonatomic, strong) UITableView * recordsTableView;

@property (nonatomic, strong) LCYNoRecordView * noRecordView;

@end

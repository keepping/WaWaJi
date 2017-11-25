//
//  ZXXEditNameViewController.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/24.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXEditNameViewController.h"

@interface ZXXEditNameViewController ()
@property(nonatomic, weak) QMUITextField *nameTextField;
@property(nonatomic, weak) UILabel *rightLabel;
@property(nonatomic, weak) QMUIFillButton *saveBotton;
@end

@implementation ZXXEditNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.nameTextField becomeFirstResponder];
}
- (void)initSubviews {
    [super initSubviews];
    
    QMUITextField *nameTextField = [[QMUITextField alloc] init];
    nameTextField.maximumTextLength = 7;
    nameTextField.qmui_borderPosition = QMUIBorderViewPositionBottom;
    [self.view addSubview:nameTextField];
    nameTextField.text = self.receivedDictionary[@"name"];
    self.nameTextField = nameTextField;
    [nameTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 44)];
    self.nameTextField.rightView = rightLabel;
    self.nameTextField.rightViewMode = UITextFieldViewModeAlways;
    self.rightLabel = rightLabel;
    rightLabel.textColor = UIColorFromRGB(0x999999);
    self.rightLabel.text = [NSString stringWithFormat:@"%zd/7",self.nameTextField.text.length];
    
    QMUIFillButton *saveBotton = [[QMUIFillButton alloc] initWithFillColor:[LCYColor lcy_navColor] titleTextColor:[LCYColor lcy_WhiteTextColor]];
    [saveBotton setTitle:@"保存" forState:UIControlStateNormal];
    [self.view addSubview:saveBotton];
    [saveBotton addTarget:self action:@selector(saveResetName) forControlEvents:UIControlEventTouchUpInside];
    self.saveBotton = saveBotton;
}

- (void)saveResetName{
    void (^popBlock)(NSString *) = self.receivedDictionary[@"block"];
    popBlock(self.nameTextField.text);
}
- (void)textFieldDidChange:(UITextField *)textField{
    self.rightLabel.text = [NSString stringWithFormat:@"%zd/7",textField.text.length];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.nameTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom).offset(50);
        make.left.equalTo(self.view).offset(14);
        make.right.equalTo(self.view).offset(-14);
        make.height.offset(44);
    }];
    [self.saveBotton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameTextField.mas_bottom).offset(90);
        make.centerX.equalTo(self.view);
        make.size.sizeOffset(CGSizeMake(150, 50));
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.title = @"修改昵称";
}

@end

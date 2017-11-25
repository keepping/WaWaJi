//
//  ZXXFeedBackViewController.m
//  WaWaJi
//
//  Created by 曾祥宪 on 2017/11/24.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ZXXFeedBackViewController.h"

@interface ZXXFeedBackViewController ()<QMUITextViewDelegate>
@property(nonatomic, weak) UILabel *question;

@property(nonatomic, weak) UIView *tuoView;
@property(nonatomic, weak) QMUITextView *userWrite;
@property(nonatomic, weak) UILabel *wordcount;

@property(nonatomic, weak) UILabel *telPhone;
@property(nonatomic, weak) UIView *tuoView2;
@property(nonatomic, weak) QMUITextField *telTextField;
@end

@implementation ZXXFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavigationItemsIsInEditMode:(BOOL)isInEditMode animated:(BOOL)animated {
    [super setNavigationItemsIsInEditMode:isInEditMode animated:animated];
    self.title = @"意见反馈";
    if (self.navigationItem.rightBarButtonItem==nil) {
        self.navigationItem.rightBarButtonItem = [QMUINavigationButton barButtonItemWithType:QMUINavigationButtonTypeNormal title:@"提交" position:-1 target:self action:@selector(sendFeedBackApi)];
    }
    
    [self.userWrite becomeFirstResponder];
}
- (void)sendFeedBackApi{
    if (self.userWrite.text.length==0) {
        [QMUITips showInfo:@"意见不能为空" inView:self.view hideAfterDelay:1.5];
    }else{
        
    }
}
- (void)initSubviews {
    [super initSubviews];
    self.view.backgroundColor = UIColorFromRGB(0xf5f5f5);
    
    // 问题与意见
    UILabel *question = [[UILabel alloc] init];
    question.text = @"问题与意见";
    [self.view addSubview:question];
    self.question = question;
    question.font = [LCYFont LCYFont14];
    question.textColor = [UIColor colorWithWhite:0.400 alpha:1.000];
    [question sizeToFit];
    
    UIView *tuoView = [[UIView alloc] init];
    [self.view addSubview:tuoView];
    self.tuoView = tuoView;
    tuoView.backgroundColor = [UIColor whiteColor];
    
    QMUITextView *userWrite = [[QMUITextView alloc] init];
    userWrite.font = [LCYFont LCYFont14];
//    userWrite.qmui_borderPosition = QMUIBorderViewPositionTop|QMUIBorderViewPositionLeft| QMUIBorderViewPositionBottom|QMUIBorderViewPositionRight;
    [tuoView addSubview:userWrite];
    self.userWrite = userWrite;
    userWrite.delegate = self;
    userWrite.placeholder = @"您的建议就是对我们最好的支持!";
    
    UILabel *telPhone = [[UILabel alloc] init];
    telPhone.text = @"联系电话";
    [self.view addSubview:telPhone];
    self.telPhone = telPhone;
    telPhone.font = [LCYFont LCYFont14];
    telPhone.textColor = [UIColor colorWithWhite:0.400 alpha:1.000];
    [telPhone sizeToFit];
    
    UIView *tuoView2 = [[UIView alloc] init];
    [self.view addSubview:tuoView2];
    self.tuoView2 = tuoView2;
    tuoView2.backgroundColor = [UIColor whiteColor];
    
    QMUITextField *telTextField = [[QMUITextField alloc] init];
    telTextField.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
    telTextField.placeholder = @"请填写您的联系方式";
    telTextField.font = [LCYFont LCYFont14];
    [tuoView2 addSubview:telTextField];
    self.telTextField = telTextField;
    
    UILabel *wordcount = [[UILabel alloc] init];
    [tuoView addSubview:wordcount];
    wordcount.font = [LCYFont LCYFont14];
    wordcount.textColor = UIColorFromRGB(0x999999);
    wordcount.text = @"0/200";
    [wordcount sizeToFit];
    self.wordcount = wordcount;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.question makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(14);
        make.top.equalTo(self.view).offset(79);
    }];
    
    [self.tuoView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(114);
        make.height.offset(193);
    }];
    
    [self.userWrite makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.tuoView).insets(UIEdgeInsetsMake(0, 14, 0, 14));
    }];
    
    [self.telPhone makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(14);
        make.top.equalTo(self.tuoView.mas_bottom).offset(15);
    }];
    [self.tuoView2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.tuoView.mas_bottom).offset(50);
        make.height.offset(50);
    }];
    [self.telTextField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(14);
        make.top.bottom.equalTo(self.tuoView2);
        make.right.equalTo(self.view).offset(-14);
    }];
    
    [self.wordcount makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.tuoView).offset(-14);
        make.bottom.equalTo(self.tuoView).offset(-14);
    }];
}

- (void)textViewDidChange:(UITextView *)textView{
    self.wordcount.text = [NSString stringWithFormat:@"%ld/200",textView.text.length];
    if (textView.text.length > 200) {
        UITextRange *markedRange = [textView markedTextRange];
        if (markedRange) {
            return;
        }
        //Emoji占2个字符，如果是超出了半个Emoji，用15位置来截取会出现Emoji截为2半
        //超出最大长度的那个字符序列(Emoji算一个字符序列)的range
        NSRange range = [textView.text rangeOfComposedCharacterSequenceAtIndex:200];
        textView.text = [textView.text substringToIndex:range.location];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end

//
//  BaseViewController.m
//  WaWaJi
//
//  Created by 朱林峰 on 2017/3/1.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //友盟页面分析
    [UMAnalytics beginLogViewController:NSStringFromClass(self.class)];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //友盟页面分析
    [UMAnalytics endLogViewController:NSStringFromClass(self.class)];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//导航栏基础设置
-(UIImage*)navigationBarBackgroundImage{
    return [UIImage qmui_imageWithColor:[LCYColor lcy_navColor]];
}

-(UIColor*)navigationBarTintColor{
    return UIColorWhite;
}

/*设置状态栏颜色*/
- (UIStatusBarStyle)preferredStatusBarStyle{
    //黑色
    //return UIStatusBarStyleDefault;
    //白色
    return UIStatusBarStyleLightContent;
}

#pragma mark —— push下一个页面
/*不传数据，直接push到下一个界面*/
-(void)push:(NSString*)controllerName{
    
    QMUINavigationController *navVc = (QMUINavigationController *)self.navigationController;
    if (!navVc.isViewControllerTransiting) {
        Class class=NSClassFromString(controllerName);
        id controller=[[class alloc] init];
        [self.navigationController pushViewController:controller animated:true];
    }
}

/*传数据到下一个界面*/
-(void)pushWithData:(NSString*)controllerName Data:(NSDictionary*)dict{
    Class class=NSClassFromString(controllerName);
    QMUINavigationController *navVc = (QMUINavigationController *)self.navigationController;
    if (!navVc.isViewControllerTransiting){
        if ([class isKindOfClass:NSClassFromString(@"BaseTableViewController")]) {
            __kindof BaseTableViewController *controller= [[class alloc] init];
            controller.receivedDictionary= dict;
            [self.navigationController pushViewController:controller animated:true];
        }else{
            __kindof BaseViewController *controller= [[class alloc] init];
            controller.receivedDictionary= dict;
            [self.navigationController pushViewController:controller animated:true];
        }
    }
}

#pragma mark —— 返回事件
/*关闭界面，返回上一级*/
-(void)pop{
    if (self.presentingViewController){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/*返回到固定界面*/
-(void)popToController:(NSString*)controllerName{
    Class class=NSClassFromString(controllerName);
    id controller=[[class alloc] init];
    NSArray *temArray = self.navigationController.viewControllers;
    for(UIViewController *temVC in temArray)
    {
        if ([temVC isKindOfClass:[controller class]])
        {
            [self.navigationController popToViewController:temVC animated:YES];
        }
    }
}

/*返回到主界面*/
-(void)popToRoot{
    [self.navigationController popToRootViewControllerAnimated:true];
}

#pragma mark —— MBProgressHUB
/*toast*/
-(void)showToast:(NSString*)text{
    MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:self.view animated:true];
    hub.mode=MBProgressHUDModeText;
    hub.margin=10.f;
    hub.removeFromSuperViewOnHide=true;
    hub.labelText=text;
    [hub hide:true afterDelay:1.5];
}

/*显示菊花图*/
-(void)showWaitView{
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
}

/*隐藏菊花图*/
-(void)hideWaitView{
    [MBProgressHUD hideHUDForView:self.view animated:true];
}

#pragma mark —— 网络请求
/*开始网络请求*/
-(void)startRequest:(YTKRequest *)request{
    [self showWaitView];
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        [self hideWaitView];
        self.returnBlock(request);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [self hideWaitView];
        self.failureBlock(request);
    }];
}

/*获取网络请求返回值*/
-(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
               WithFailureBlock: (FailureBlock) failureBlock{
    _returnBlock=returnBlock;
    _failureBlock=failureBlock;
}


@end

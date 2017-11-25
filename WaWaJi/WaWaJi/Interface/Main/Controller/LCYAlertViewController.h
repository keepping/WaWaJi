//
//  LCYAlertViewController.h
//  WaWaJi
//
//  Created by 刘岑颖 on 2017/11/24.
//  Copyright © 2017年 james. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LCYBalanceNotEnoughType,
    LCYCacheSuccessType,
    LCYCacheFailedType,
} LCYAlertType;

@interface LCYAlertViewController : UIViewController

@property (nonatomic) LCYAlertType alertType;

- (void)dismissAction;

@property (nonatomic, strong) void(^LCYAddressCallBack) (id obj);

@end

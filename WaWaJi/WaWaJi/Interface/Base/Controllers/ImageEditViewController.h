//
//  ImageEditViewController.h
//  WaWaJi
//
//  Created by zoekebi_Mac on 2017/6/6.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^PushImageBlock)(UIImage *);
@interface ImageEditViewController : BaseViewController
@property (copy,nonatomic)PushImageBlock block;
- (instancetype)initWithSize:(CGSize)size;
@end

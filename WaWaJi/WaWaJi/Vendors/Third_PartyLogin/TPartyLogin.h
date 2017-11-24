//
//  3thPartyModel.h
//  WaWaJi
//
//  Created by 王陈洁 on 17/6/8.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>

typedef void(^myBlock) (id obj);

@interface TPartyLogin : NSObject

+ (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType andCallBack:(myBlock)callBack;

@end

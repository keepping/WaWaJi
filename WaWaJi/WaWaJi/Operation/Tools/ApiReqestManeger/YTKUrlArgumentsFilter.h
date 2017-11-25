//
//  YTKUrlArgumentsFilter.h
//  WaWaJi
//
//  Created by zoekebi_Mac on 2017/4/18.
//  Copyright © 2017年 lcying. All rights reserved.
//

#import "YTKNetworkConfig.h"
#import "YTKBaseRequest.h"

@interface YTKUrlArgumentsFilter : NSObject<YTKUrlFilterProtocol>

+ (YTKUrlArgumentsFilter *_Nonnull)filterWithArguments:(NSDictionary *_Nullable)arguments;

- (NSString * _Nonnull)filterUrl:(NSString* _Nonnull) originUrl withRequest:(YTKBaseRequest *_Nullable)request;

@end

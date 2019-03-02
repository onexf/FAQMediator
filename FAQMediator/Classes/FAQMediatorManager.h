//
//  FAQMediatorManager.h
//  TargetAction
//
//  Created by 王鑫锋 on 2019/3/2.
//  Copyright © 2019 王鑫锋. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAQMediatorManager : NSObject

/**
 中间件调用基础接口
 
 @param targetName 响应者
 @param actionName 方法名
 @param params 传递参数
 @param isRequiredReturnValue 所调用的方法是否有返回值
 @return 返回结果
 */
+ (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(id)params isRequiredReturnValue: (BOOL)isRequiredReturnValue;

@end

NS_ASSUME_NONNULL_END

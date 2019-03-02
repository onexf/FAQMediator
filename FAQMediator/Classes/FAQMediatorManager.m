//
//  FAQMediatorManager.m
//  TargetAction
//
//  Created by 王鑫锋 on 2019/3/2.
//  Copyright © 2019 王鑫锋. All rights reserved.
//

#import "FAQMediatorManager.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#import <objc/runtime.h>

@implementation FAQMediatorManager

+ (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(id)params isRequiredReturnValue: (BOOL)isRequiredReturnValue {

    // 1. 获取目标
    Class targetCls = NSClassFromString(targetName);
    if (targetCls == nil) {
        NSLog(@"目标不存在");
        return nil;
    }

    // 2. 获取行为
    SEL sel = NSSelectorFromString(actionName);
    if (sel == nil) {
        NSLog(@"行为不存在");
        return nil;
    }

    if (![targetCls respondsToSelector:sel]) {
        NSLog(@"目标不存在该方法");
        return nil;
    }

    if (isRequiredReturnValue) {
        SuppressPerformSelectorLeakWarning(return [targetCls performSelector:sel withObject:params]);
    }else {
        SuppressPerformSelectorLeakWarning([targetCls performSelector:sel withObject:params]);
    }
    
    return nil;

}

@end

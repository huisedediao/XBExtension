//
//  UIViewController+CustomFunctions.m
//  XBRuntimeTest
//
//  Created by chuango on 16/10/25.
//  Copyright © 2016年 chuango. All rights reserved.
//

#import "UIViewController+CustomFunctions.h"
//#import <objc/runtime.h>
#import <objc/message.h>

#ifdef DEBUG //处于调试阶段,打印
#define NSLog(...) NSLog(__VA_ARGS__)
#else   //发布阶段,不打印
#define NSLog(...)
#endif

@implementation UIViewController (CustomFunctions)
+ (void)load {
    
    //我们只有在开发的时候才需要查看哪个viewController将出现
    //所以在release模式下就没必要进行方法的交换
#ifdef DEBUG
    
    //原本的viewWillAppear方法
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    
    //需要替换成 能够输出日志的viewWillAppear
    Method logViewWillAppear = class_getInstanceMethod(self, @selector(logViewWillAppear:));
    
    //两方法进行交换
    method_exchangeImplementations(viewWillAppear, logViewWillAppear);

    //检查是否销毁
    Method dealloc=class_getInstanceMethod(self, sel_registerName("dealloc"));
    Method logDealloc=class_getInstanceMethod(self, @selector(logDealloc));
    method_exchangeImplementations(dealloc, logDealloc);
#endif
    
}
-(void)logDealloc
{
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"----------------->>>销毁%@ 销毁\n\n\n",className);
    
    [self logDealloc];
}

- (void)logViewWillAppear:(BOOL)animated {
    
    NSString *className = NSStringFromClass([self class]);
    
    //在这里，你可以进行过滤操作，指定哪些viewController需要打印，哪些不需要打印
    if ([className hasPrefix:@"UI"] == NO) {
        NSLog(@"----------------->>>显示%@ 显示\n\n\n",className);
    }
    //下面方法的调用，其实是调用viewWillAppear
    [self logViewWillAppear:animated];
}

@end

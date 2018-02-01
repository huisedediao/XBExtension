//
//  UIView+SingleClick.m
//  AnXin
//
//  Created by xxb on 2018/2/1.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "UIView+SingleClick.h"
#import <objc/runtime.h>

@implementation UIView (SingleClick)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSel = @selector(addSubview:);
        SEL swizzSel = @selector(myAddSubview:);
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
        if (isAdd) {
            class_replaceMethod(self, swizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        }else{
            method_exchangeImplementations(systemMethod, swizzMethod);
        }
    });
}

- (void)myAddSubview:(UIView *)view{
    if ([view respondsToSelector:@selector(setExclusiveTouch:)]) {
        [view setExclusiveTouch:YES];
    }
    [self myAddSubview:view];
}

@end

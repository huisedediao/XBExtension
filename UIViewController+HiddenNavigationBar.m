//
//  UIViewController+HiddenNavigationBar.m
//  W100_smanos
//
//  Created by xxb on 2018/10/24.
//  Copyright © 2018年 王振. All rights reserved.
//

#import "UIViewController+HiddenNavigationBar.h"
#import <objc/message.h>

@implementation UIViewController (HiddenNavigationBar)

+ (void)load
{
    Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method viewDidLoad_log = class_getInstanceMethod(self, @selector(viewDidLoad_log));
    method_exchangeImplementations(viewDidLoad, viewDidLoad_log);
}

- (void)viewDidLoad_log
{
    self.navigationController.delegate = self;
    [self viewDidLoad_log];
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isSelf = [viewController isKindOfClass:[self class]];
    if (isSelf)
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

@end

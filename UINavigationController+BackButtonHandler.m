//
//  UINavigationController+BackButtonHandler.m
//  XBMediaTool
//
//  Created by xxb on 2018/12/5.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "UINavigationController+BackButtonHandler.h"

@implementation UINavigationController (BackButtonHandler)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController *vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [(UIViewController <BackButtonHandlerProtocol> *)vc navigationShouldPopOnBackButton];
    }
    
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *subview in [navigationBar subviews]) {
            if(0. < subview.alpha && subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
    }
    
    return NO;
}
@end

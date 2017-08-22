//
//  UIViewController+AWOrientation.m
//  aw1_plus
//
//  Created by he yan on 05/01/2017.
//  Copyright © 2017 sven. All rights reserved.
//

#import "UIViewController+AWOrientation.h"
#import "IPHomeViewController.h"
#import "IPPlayVideoController.h"
#import "XBImageBrowser_smanos.h"
#import <REFrostedViewController.h>
#import "AWNavigationViewController.h"
#import "IPHistoryPlayerViewController.h"
#import "IPPlayBackViewController.h"

@implementation UIViewController (AWOrientation)

- (BOOL)shouldAutorotate{
//    if ([self bIsClass:[IPHomeViewController class]] ||
//        [self isKindOfClass:[IPPlayVideoController class]] ||
//        [self isKindOfClass:[XBImageBrowser_smanos class]]) {
//        return YES;
//    }
//    else
        return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    if ([self bIsClass:[IPPlayBackViewController class]] ||
        [self isKindOfClass:[IPPlayVideoController class]] ||
        [self isKindOfClass:[XBImageBrowser_smanos class]]){
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    
    if ([self bIsClass:[REFrostedViewController class]])
    {
        AppDelegate *delegate = [AppDelegate sharedInstance];
        if ([[delegate.window.rootViewController class] isSubclassOfClass:[REFrostedViewController class]]) {
            REFrostedViewController *rostVC = (REFrostedViewController *)delegate.window.rootViewController;
            UINavigationController *nav =(UINavigationController *)[rostVC contentViewController];
            if ([[nav.topViewController class] isSubclassOfClass:[IPHomeViewController class]]
                ||[[nav.topViewController class] isSubclassOfClass:[IPHistoryPlayerViewController class]]
                ||[[nav.topViewController class] isSubclassOfClass:[IPPlayBackViewController class]])
            {
                if ([[AppDelegate sharedInstance] canRotate]) {
                    return UIInterfaceOrientationMaskAllButUpsideDown;
                }else
                    return UIInterfaceOrientationMaskPortrait;
            }
        }
    }
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
- (BOOL)bIsClass:(Class)className
{
    if ([self isKindOfClass:className]) {
        return YES;
    }else if ([self isKindOfClass:[UINavigationController class]]){
        UINavigationController *nav = (UINavigationController *)self;
        if ([nav.topViewController isKindOfClass:[className class]]) {
            return YES;
        }
    }
    return NO;
}
@end

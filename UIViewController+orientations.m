//
//  UIViewController+orientations.m
//  smanos
//
//  Created by sven on 3/18/16.
//  Copyright © 2016 sven. All rights reserved.
//

#import "UIViewController+orientations.h"
#import <REFrostedViewController.h>
#import "AppDelegate.h"
#import "IPHomeViewController.h"
#import "IPHistoryPlayerViewController.h"
#import "IPPlayBackViewController.h"
#import "IPPlayVideoController.h"
#import "XBImageBrowser_smanos.h"
#import "ActivityZoneSetViewController.h"

@implementation UIViewController (orientations)

#pragma mark --

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

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{

    if ([self isKindOfClass:[IPPlayVideoController class]] ||
        [self isKindOfClass:[XBImageBrowser_smanos class]]){
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    
    if ([self isKindOfClass:[UINavigationController class]] && [[AppDelegate sharedInstance] canRotate]) {
        UINavigationController *nav = (UINavigationController *)self;
        if ([nav.topViewController isKindOfClass:[ActivityZoneSetViewController class]]) {
            return UIInterfaceOrientationMaskAllButUpsideDown;
        }
    }
    
    if ([self bIsClass:[REFrostedViewController class]])
    {
        AppDelegate *delegate = [AppDelegate sharedInstance];
        if ([[delegate.window.rootViewController class] isSubclassOfClass:[REFrostedViewController class]]) {
            REFrostedViewController *rostVC = (REFrostedViewController *)delegate.window.rootViewController;
            
            Class class = nil;

            UINavigationController *nav =(UINavigationController *)[rostVC contentViewController];
            class = [nav.topViewController class];
            
            if (([class isSubclassOfClass:[IPHomeViewController class]] && [[AppDelegate sharedInstance] canRotate])
                || [class isSubclassOfClass:[IPHistoryPlayerViewController class]]
                || [class isSubclassOfClass:[IPPlayBackViewController class]])
            {
                return UIInterfaceOrientationMaskAllButUpsideDown;
            }
        }
    }
    return UIInterfaceOrientationMaskPortrait;
}


@end

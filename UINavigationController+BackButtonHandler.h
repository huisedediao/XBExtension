//
//  UINavigationController+BackButtonHandler.h
//  XBMediaTool
//
//  Created by xxb on 2018/12/5.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BackButtonHandlerProtocol <NSObject>
@optional
// Override this method in UIViewController derived class to handle 'Back' button click
-(BOOL)navigationShouldPopOnBackButton;
@end

@interface UINavigationController (BackButtonHandler)

@end

NS_ASSUME_NONNULL_END

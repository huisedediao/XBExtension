//
//  UIView+AdaptKeyboard.h
//  XBOtherWifiView
//
//  Created by xxb on 2017/1/18.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AdaptKeyboard)

/** 
 参数1：展示在哪个view上（相对于哪个view调整位置）
 参数2：键盘将要展示通知
 */
-(void)xb_adaptKeyBoardForShowWithDisplayView:(UIView *)displayView notification:(NSNotification *)noti;


/**
 * 参数：展示在哪个view上 （相对于哪个view调整位置）
 */
-(void)xb_adaptKeyBoardForHideWithDisplayView:(UIView *)displayView;
@end

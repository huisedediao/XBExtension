//
//  UIView+AdaptKeyboard.m
//  XBOtherWifiView
//
//  Created by xxb on 2017/1/18.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "UIView+AdaptKeyboard.h"

@implementation UIView (AdaptKeyboard)

/** 键盘不遮挡所需view */
-(void)xb_adaptKeyBoardForShowWithDisplayView:(UIView *)displayView notification:(NSNotification *)noti
{
    static NSTimeInterval last = 0;
    NSTimeInterval current = [[NSDate date] timeIntervalSince1970];
    NSLog(@"current:%f",current);
    if (current - last > 1)
    {
        [displayView layoutIfNeeded];
        
        //获取取键盘展开后的rect
        CGRect rect = [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
        //获取键盘的高度
        CGFloat keyBoardHeight = rect.size.height;
        
        
        //    CGRect beginKeyboardRect = [[noti.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        //    CGRect endKeyboardRect = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        //
        //    CGFloat keyBoardHeight=beginKeyboardRect.origin.y-endKeyboardRect.origin.y;
        
        if (keyBoardHeight<215)
        {
            keyBoardHeight=250;
        }
        
        CGRect viewRect=[self convertRect:self.bounds toView:displayView];
        CGFloat maxYOfView=CGRectGetMaxY(viewRect);
        CGFloat displayViewH=displayView.bounds.size.height;
        
        CGFloat gap= (displayViewH-keyBoardHeight)-maxYOfView;
        
        if (gap<0)//被遮挡了
        {
            [UIView animateWithDuration:0.5 animations:^{
                CGRect tempRect=displayView.frame;
                tempRect.origin.y+=gap;
                displayView.frame=tempRect;
            }];
        }
    }
    
    last = current;
}

-(void)xb_adaptKeyBoardForHideWithDisplayView:(UIView *)displayView
{
    CGRect tempRect = displayView.frame;
    tempRect.origin.y=0;
    displayView.frame=tempRect;
}
@end

//
//  UIScrollView+DoNotDelaysContentTouches.m
//  AnXin
//
//  Created by xxb on 2018/2/1.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "UIScrollView+DoNotDelaysContentTouches.h"

@implementation UIScrollView (DoNotDelaysContentTouches)
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    //备注：UIScrollView需设置 delaysContentTouches  NO;
    return YES;
}
@end

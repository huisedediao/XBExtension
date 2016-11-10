//
//  UIView+CustomFunctions.h
//  test
//
//  Created by XXB on 16/5/8.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CustomFunctions)

/**
 判断是不是某个view的子view
 */
-(BOOL)isSubViewOfView:(UIView *)fatherView;


/**
 自身的高度
 */
-(CGFloat)height;


/**
 自身的宽度
 */
-(CGFloat)width;


/**
 ** lineLength:	 虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:	  虚线的颜色
 **/
- (void)drawDashLineLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

@end

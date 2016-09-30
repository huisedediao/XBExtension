//
//  UIButton+CustomFunctions.h
//  XBTest
//
//  Created by XXB on 16/9/16.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XBDefine.h"

@interface UIButton (CustomFunctions)

/**
 *  图片在上，文字在下布局
 *  参数1：图片在竖直方向上所占的比例
 *  参数2：图片顶部离button顶部的距离
 */
-(void)imageTopAndTitleBottomWithImageHScale:(CGFloat)imageHScale topSpace:(CGFloat)topSpace;


/**
 *  图片文字同一水平线上布局
 *  参数1：图片在竖直方向上所占的比例
 *  参数2：图片和文字之间的距离
 *  参数3：内容（图片和文字）靠左边、处于中间、靠右
 *  参数4：靠左或者靠右时，内容（图片和文字）离边缘的距离
 */
-(void)imageLeftAndTitleRightWithImageHScale:(CGFloat)imageHScale spaceOfImageAndTitle:(CGFloat)spaceOfImageAndTitle side:(XBLCRSide)side sideSpace:(CGFloat)sideSpace;
@end

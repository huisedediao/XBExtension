//
//  UIView+FrameLayout.h
//  test
//
//  Created by XXB on 16/5/7.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBDefine.h"



@interface UIView (FrameLayout)

/**
 根据传入的size和rect，算出这个size要处于rect的中央所需要的rect
 */
+(CGRect)xb_getRectOfSize:(CGSize)size sameCenterWithRect:(CGRect)rect;



/**
 自身的高度
 */
-(CGFloat)xb_height;


/**
 自身的宽度
 */
-(CGFloat)xb_width;


/**
 中心点位置
 */
-(CGPoint)xb_center;


/**
 自身的size
 */
-(CGSize)xb_size;



/**
 最小的x值
 */
-(CGFloat)xb_left;

/**
 最大的x值
 */
-(CGFloat)xb_right;

/**
 最小的y值
 */
-(CGFloat)xb_top;

/**
 最大的y值
 */
-(CGFloat)xb_bottom;



/**
 所有subView中,最大的maxX\n
 */
-(CGFloat)xb_maxXOfSubviews;

/**
 所有subView中,最大的maxY
 */
-(CGFloat)xb_maxYOfSubviews;


/**
 centerX;
 前提:必须设置了宽度
 */
-(void)xb_centerX:(CGFloat)centerX;

/**
 centerY;
 前提:必须设置了宽度
 */
-(void)xb_centerY:(CGFloat)centerY;


/**
 左边距离选定view的左边或者右边的距离
 * 参数1:距离,正数为参照view的那一边向右,负数向左
 * 参数2:参考view
 * 参数3:左边还是右边
 */
-(void)xb_leftSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side;

/**
 右边距离选定view的左边或者右边的距离
 注意:设置此项之前必须设置左边距
 * 参数1:距离,正数为参照view的那一边向右,负数向左
 * 参数2:参考view
 * 参数3:左边还是右边
 */
-(void)xb_rightSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side;

/**
 顶边距离选定view的左边或者右边的距离
 * 参数1:距离,正数为参照view的那一边向下,负数向上
 * 参数2:参考view
 * 参数3:上边还是下边
 */
-(void)xb_topSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side;

/**
 底边距离选定view的左边或者右边的距离
 注意:设置此项之前必须设置顶边距
 * 参数1:距离,正数为参照view的那一边向下,负数向上
 * 参数2:参考view
 * 参数3:上边还是下边
 */
-(void)xb_bottomSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side;





/**
 右边距离选定view的左边或者右边的距离
 * 参数1:距离,正数为参照view的那一边向右,负数向左
 * 参数2:参考view
 * 参数3:左边还是右边
 * 参数4:宽度
 */
-(void)xb_rightSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side width:(CGFloat)viewWidth;

/**
 底边距离选定view的左边或者右边的距离
 * 参数1:距离,正数为参照view的那一边向下,负数向上
 * 参数2:参考view
 * 参数3:上边还是下边
 * 参数4:高度
 */
-(void)xb_bottomSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side height:(CGFloat)viewHeight;

/**
 右边距离选定view的左边或者右边的距离
 * 参数1:距离,正数为参照view的那一边向右,负数向左
 * 参数2:参考view
 * 参数3:左边还是右边
 * 参数4:左边的值
 */
//-(void)xb_rightSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side left:(CGFloat)viewLeft;

/**
 底边距离选定view的左边或者右边的距离
 * 参数1:距离,正数为参照view的那一边向下,负数向上
 * 参数2:参考view
 * 参数3:上边还是下边
 * 参数4:顶部的值
 */
//-(void)xb_bottomSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side top:(CGFloat)viewTop;





/**
 左边的位置
 */
-(void)xb_left:(CGFloat)viewLeft;

/**
 右边的位置
 注意:设置此项前,先设置left
 */
-(void)xb_right:(CGFloat)viewRight;

/**
 顶边的位置
 */
-(void)xb_top:(CGFloat)viewTop;

/**
 底边的位置,传view或者NSNumber
 注意:设置此项前先设置top
 */
-(void)xb_bottom:(CGFloat)viewBottom;





/**
 左边的位置,传view
 */
-(void)xb_leftEqualTo:(UIView *)view;

/**
 右边的位置,传view
 注意:设置此项前,先设置left
 */
-(void)xb_rightEqualTo:(UIView *)view;

/**
 顶边的位置,传view
 */
-(void)xb_topEqualTo:(UIView *)view;

/**
 底边的位置,传view
 注意:设置此项前先设置top
 */
-(void)xb_bottomEqualTo:(UIView *)view;





/**
 右边的位置,宽度
 */
-(void)xb_right:(CGFloat)viewRight width:(CGFloat)width;

/**
 底边的位置,高度
 */
-(void)xb_bottom:(CGFloat)viewBottom height:(CGFloat)height;

/**
 右边的位置,左边的位置
 */
//-(void)xb_right:(CGFloat)viewRight left:(CGFloat)viewLeft;

/**
 底边的位置,顶边的位置
 */
//-(void)xb_bottom:(CGFloat)viewBottom top:(CGFloat)viewTop;





/**
 上下左右
 */
-(void)xb_left:(CGFloat)left right:(CGFloat)right top:(CGFloat)top bottom:(CGFloat)bottom;

/**
 左上宽高
 */
-(void)xb_left:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;




/**
 设置width
 */
-(void)xb_width:(CGFloat)width;

/**
 width上添加的量
 */
-(void)xb_widthAdd:(CGFloat)width;

/**
 设置height
 */
-(void)xb_height:(CGFloat)height;

/**
 height上添加的量
 */
-(void)xb_heightAdd:(CGFloat)height;



/**
 设置width
 * 参数1:参照view
 * 参数2:倍数
 * 参数3:调整量,正加,负减
 */
-(void)xb_widthEqualToView:(UIView *)view multiplier:(CGFloat)multiplier constant:(CGFloat)constant;

/**
 设置height
 * 参数1:参照view
 * 参数2:倍数
 * 参数3:调整量,正加,负减
 */
-(void)xb_heightEqualToView:(UIView *)view multiplier:(CGFloat)multiplier constant:(CGFloat)constant;





/**
 高度和宽度相等
 */
-(void)xb_heightEqualToWidthMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;

/**
 宽度和高度相等
 */
-(void)xb_widthEqualToHeightMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;





/**
 设置size
 */
-(void)xb_size:(CGSize)size;

/**
 设置size和某个view相同
 */
-(void)xb_sizeEqualToView:(UIView *)view;





/**
 和某个view同一个中心点
 前提1:必须先设置好size
 前提2:必须是兄弟view或者self是view的子view
 参数1:参考view
 */
-(void)xb_centerEqualToView:(UIView *)view;

/**
 和某个view同centerX;
 前提1:必须先设置好size
 前提2:必须是兄弟view或者self是view的子view
 */
-(void)xb_centerXEqualToView:(UIView *)view;

/**
 和某个view同centerY;
 前提1:必须先设置好size
 前提2:必须是兄弟view或者self是view的子view
 */
-(void)xb_centerYEqualToView:(UIView *)view;

/**
 和某个view同centerX;
 前提1:必须先设置好size
 前提2:必须是兄弟view或者self是view的子view
 * 参数1:参照view
 * 参数2:倍数
 * 参数3:位置调整,正右,负左
 */
-(void)xb_centerXEqualToView:(UIView *)view multiplier:(CGFloat)multiplier constant:(CGFloat)constant;

/**
 和某个view同centerY;
 前提1:必须先设置好size
 前提2:必须是兄弟view或者self是view的子view
 * 参数1:参照view
 * 参数2:倍数
 * 参数3:位置调整,正下,负上
 */
-(void)xb_centerYEqualToView:(UIView *)view multiplier:(CGFloat)multiplier constant:(CGFloat)constant;





/**
 调整frame.origin
 addOriginX:原来x上添加的量
 addOriginY:原来Y上添加的量
 */
-(void)xb_updateOriginAddOriginX:(CGFloat)addOriginX addOriginY:(CGFloat)addOriginY;

/**
 调整frame.size
 addOriginX:原来x上添加的量
 addOriginY:原来Y上添加的量
 */
-(void)xb_updateSizeAddWidth:(CGFloat)addWidth addHeight:(CGFloat)addHeight;

/**
 中心点不动,调整frame.size
 * addWidth:原来宽度上添加的量
 * addHeight:原来高度上添加的量
 */
-(void)xb_updateSizeKeepCenterAddWidth:(CGFloat)addWidth addHeight:(CGFloat)addHeight;

/**
 中心点不动,调整frame.size
 * 参数1:新的size
 */
-(void)xb_updateSizeKeepCenterNewSize:(CGSize)size;


@end

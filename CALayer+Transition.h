//
//  CALayer+Transition.h
//  XBVideoTool
//
//  Created by xxb on 2018/11/30.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

/************ 动画类型 *****************************/
typedef enum {
    
    TransitionAnimTypeRippleEffect=0, // 水波
    TransitionAnimTypeSuckEffect,     // 吸走
    TransitionAnimTypePageCurl,       // 翻开书本
    TransitionAnimTypeOglFlip,        // 正反翻转
    TransitionAnimTypeCube,           // 正方体
    TransitionAnimTypeReveal,         // push推开
    TransitionAnimTypePageUnCurl,     // 合上书本
    TransitionAnimTypeRamdom,         // 随机
} TransitionAnimType;

/************ 动画方向 *****************************/
typedef enum {
    
    TransitionSubtypesFromTop=0,  // 从上
    TransitionSubtypesFromLeft,   // 从左
    TransitionSubtypesFromBotoom, // 从下
    TransitionSubtypesFromRight,  // 从右
    TransitionSubtypesFromRamdom, // 随机
} TransitionSubType;

/************ 动画曲线 *****************************/
typedef enum {
    
    TransitionCurveDefault,       // 默认
    TransitionCurveEaseIn,        // 缓进
    TransitionCurveEaseOut,       // 缓出
    TransitionCurveEaseInEaseOut, // 缓进缓出
    TransitionCurveLinear,        // 线性
    TransitionCurveRamdom,        // 随机
} TransitionCurve;

@interface CALayer (Transition)
/**
 *  转场动画
 *
 *  @param animType 转场动画类型
 *  @param subType  转动动画方向
 *  @param curve    转动动画曲线
 *  @param duration 转动动画时长
 *
 *  @return 转场动画实例
 */
- (CATransition *)transitionWithAnimType:(TransitionAnimType)animType subType:(TransitionSubType)subType curve:(TransitionCurve)curve duration:(CGFloat)duration;
@end

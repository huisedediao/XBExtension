//
//  NSMutableAttributedString+XBExtension.h
//  XBAttributedExtension
//
//  Created by xxb on 2017/5/11.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//typedef NS_ENUM(NSInteger, NSUnderlineStyle) {
//    NSUnderlineStyleNone                                    = 0x00,
//    NSUnderlineStyleSingle                                  = 0x01, //细的单实线
//    NSUnderlineStyleThick NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x02, //粗的单实线
//    NSUnderlineStyleDouble NS_ENUM_AVAILABLE(10_0, 7_0)     = 0x09, //细双实线
//    
//    NSUnderlinePatternSolid NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x0000,
//    NSUnderlinePatternDot NS_ENUM_AVAILABLE(10_0, 7_0)        = 0x0100,
//    NSUnderlinePatternDash NS_ENUM_AVAILABLE(10_0, 7_0)       = 0x0200,
//    NSUnderlinePatternDashDot NS_ENUM_AVAILABLE(10_0, 7_0)    = 0x0300,
//    NSUnderlinePatternDashDotDot NS_ENUM_AVAILABLE(10_0, 7_0) = 0x0400,
//    
//    NSUnderlineByWord NS_ENUM_AVAILABLE(10_0, 7_0)            = 0x8000
//} NS_ENUM_AVAILABLE(10_0, 6_0);

#define xb_textRange (NSMakeRange(100000, 100000))





@interface NSMutableAttributedString (XBExtension)


#pragma mark - 类方法
/**
 获取带有行间距和字间距的富文本
 参数1：文字
 参数2：字体
 参数3：行间距
 参数4：字间距
 */
+ (NSMutableAttributedString *)xb_getAttributedStringWithStr:(NSString*)str font:(UIFont*)font lineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace;

/**
 计算文字的高度（带有行间距和字间距的情况）
 参数1：文字
 参数2：字体
 参数3：最长的显示宽度
 参数4：行间距
 参数5：字间距
 */
+ (CGFloat)xb_getHeightWith:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width lineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace;



#pragma mark - 颜色

/** 
 设置某个范围的颜色
 参数1：颜色
 参数2：显示该颜色的范围
 */
- (void)xb_setColor:(UIColor *)color range:(NSRange)range;

/**
 设置文字背景颜色
 参数1：颜色
 参数2：显示该颜色的范围
 */
- (void)xb_setBackgroundColor:(UIColor *)color range:(NSRange)range;



#pragma mark - 字体
/**
 设置某个范围的字体
 参数1：字体
 参数2：显示该字体的防伪
 */
- (void)xb_setFont:(UIFont *)font range:(NSRange)range;




#pragma mark - 间距


/**
 设置文字行间距
 参数：间距
 */
- (void)xb_setLineSpace:(CGFloat)lineSpace range:(NSRange)range;


/**
 设置文字字间距
 参数：间距
 */
- (void)xb_setTextSpace:(CGFloat)textSpace range:(NSRange)range;




#pragma mark - 下划线
/**
 设置下划线的样式 （下划线的粗细跟随最大的文字）
 参数1：样式
 参数2：范围
 */
- (void)xb_setUnderlineStyle:(NSUnderlineStyle)style range:(NSRange)range;

/**
 设置下划线的颜色
 参数1：颜色
 参数2：范围
 */
- (void)xb_setUnderlineColor:(UIColor *)color range:(NSRange)range;



#pragma mark - 删除线

/**
 设置删除线的样式 (删除线的颜色和被删除线覆盖的文字颜色是一样的)
 参数1：样式
 参数2：范围
 */
- (void)xb_setDeletelineStyle:(NSUnderlineStyle)style range:(NSRange)range;

/**
 设置删除线的颜色 (删除线的颜色和被删除线覆盖的文字颜色是一样的)
 参数1：颜色
 参数2：范围
 */
- (void)xb_setDeletelineColor:(UIColor *)color range:(NSRange)range;


#pragma mark - 空心情况
/**
 设置空心的颜色
 参数1：颜色
 参数2：范围
 */
- (void)xb_setStrokeColor:(UIColor *)color range:(NSRange)range;

/**
 设置空心的宽度
 参数1：宽度 （正数为空心，负数为加粗）
 参数2：范围
 */
- (void)xb_setStrokeWidth:(CGFloat)width range:(NSRange)range;


#pragma mark - 偏移
/**
 设置上下偏移
 参数1：偏移的量（正数：向上偏移，负数：向下偏移）
 参数2：范围
 */
- (void)xb_setOffset:(CGFloat)offset range:(NSRange)range;


#pragma mark - 倾斜

/**
 设置字形倾斜度，正值右倾，负值左倾
 参数1：倾斜度
 参数2：范围
 */
- (void)xb_setTilt:(CGFloat)tilt range:(NSRange)range;


#pragma mark - 拉伸

/**
 横向拉伸或压缩文本：正值横向拉伸文本，负值横向压缩文本
 参数1：拉伸值
 参数2：范围
 */
- (void)xb_setExpansion:(CGFloat)expansion range:(NSRange)range;

//
//#pragma mark - 文字书写方向
//
///**
// 设置文字书写方向 (不起效果)
// 参数1：0：从左向右，1：从右向左
// 参数2：范围
// */
//- (void)xb_setWritingDirection:(NSWritingDirection)direction range:(NSRange)range;

#pragma mark - 设置纵向方向

/**
 设置文字书写方向 （不起效果）
 参数1：0 表示横排文本，1 表示竖排文本
 参数2：范围
 */
//- (void)xb_setVerticalDirection:(int)direction range:(NSRange)range;
@end

//
//  UITextField+CustomFunctioms.h
//  XBTest
//
//  Created by chuango on 16/9/18.
//  Copyright © 2016年 chuango. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CustomFunctioms)

-(void)placeholderColor:(UIColor *)placeholderColor placeholderFont:(UIFont *)placeholderFont placeholder:(NSString *)placeholder;


/**
 * 用于旧工程，不支持上面那个方法的情况下
 * 自动根据tf的文本来显示placeHolder
 */
-(void)autoSetTFCusPlaceHolder:(NSString *)placeHolder editingBgImage:(UIImage *)editingBgImage normalBgImage:(UIImage *)normalBgImage placeHolderColor:(UIColor *)placeHolderColor placeHolderFont:(UIFont *)placeHolderFont placeholderSpaceToLeft:(CGFloat)placeholderSpaceToLeft;
/**
 * 用于旧工程，不支持上面那个方法的情况下
 * 根据背景图片和placeHolder合成一张背景图片
 */
+(UIImage *)whileColorHolderImgForTF:(UITextField *)tf bgImage:(UIImage *)bgImage placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor placeHolderFont:(UIFont *)placeHolderFont placeholderSpaceToLeft:(CGFloat)placeholderSpaceToLeft;

@end

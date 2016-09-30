//
//  UITextField+CustomFunctioms.m
//  XBTest
//
//  Created by chuango on 16/9/18.
//  Copyright © 2016年 chuango. All rights reserved.
//

#import "UITextField+CustomFunctioms.h"
#import "XBDefine.h"

@implementation UITextField (CustomFunctioms)
-(void)placeholderColor:(UIColor *)placeholderColor placeholderFont:(UIFont *)placeholderFont placeholder:(NSString *)placeholder
{
    if (placeholder)
    {
        self.placeholder=placeholder;
    }
    if(self.placeholder)
    {
        self.textColor=[UIColor whiteColor];
        NSString *holderText = self.placeholder;
        NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:holderText];
        if (placeholderColor)
        {
            [placeholder addAttribute:NSForegroundColorAttributeName
                                value:placeholderColor
                                range:NSMakeRange(0, holderText.length)];
        }
        [placeholder addAttribute:NSFontAttributeName  
                            value:(placeholderFont?placeholderFont:self.font)
                            range:NSMakeRange(0, holderText.length)];  
        self.attributedPlaceholder = placeholder;
    } 
}

/**
 * 用于旧工程，不支持上面那个方法的情况下
 * 自动根据tf的文本来显示placeHolder
 */
-(void)autoSetTFCusPlaceHolder:(NSString *)placeHolder editingBgImage:(UIImage *)editingBgImage normalBgImage:(UIImage *)normalBgImage placeHolderColor:(UIColor *)placeHolderColor placeHolderFont:(UIFont *)placeHolderFont placeholderSpaceToLeft:(CGFloat)placeholderSpaceToLeft
{
    if(StringIsEmpty(self.text) && self.editing==YES)
    {
        [self setBackground:[UITextField cusHolderImgForTF:self bgImage:editingBgImage placeHolder:placeHolder placeHolderColor:placeHolderColor placeHolderFont:placeHolderFont placeholderSpaceToLeft:placeholderSpaceToLeft]];
        self.placeholder=@"";
    }
    else if(StringIsEmpty(self.text)==NO && self.editing==YES)
    {
        [self setBackground:editingBgImage];
        if([self.placeholder isEqualToString:@""])
        {
            self.placeholder=placeHolder;
        }
    }
    else
    {
        [self setBackground:normalBgImage];
        if([self.placeholder isEqualToString:@""])
        {
            self.placeholder=placeHolder;
        }
    }
}
/**
 * 用于旧工程，不支持上面那个方法的情况下
 * 根据背景图片和placeHolder合成一张背景图片
 */
+(UIImage *)cusHolderImgForTF:(UITextField *)tf bgImage:(UIImage *)bgImage placeHolder:(NSString *)placeHolder placeHolderColor:(UIColor *)placeHolderColor placeHolderFont:(UIFont *)placeHolderFont placeholderSpaceToLeft:(CGFloat)placeholderSpaceToLeft
{
    UIGraphicsBeginImageContextWithOptions(tf.frame.size, NO, 0.0);
    [bgImage drawInRect:CGRectMake(0, 0, tf.frame.size.width, tf.frame.size.height)];
    NSMutableDictionary *textParams=[NSMutableDictionary new];
    textParams[NSForegroundColorAttributeName]=placeHolderColor;
    textParams[NSFontAttributeName]=placeHolderFont;
    [placeHolder drawAtPoint:CGPointMake(placeholderSpaceToLeft, (tf.frame.size.height-20)*0.5) withAttributes:textParams];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end

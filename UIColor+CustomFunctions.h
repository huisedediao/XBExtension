//
//  UIColor+CustomFunctions.h
//  XBGradientColorView
//
//  Created by xxb on 2016/11/26.
//  Copyright © 2016年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CustomFunctions)

/** 16进制字符串转成UIColor */
+(UIColor *)colorWithHex: (NSString *) stringToConvert;
/** 16进制字符串转成UIColor */
+(UIColor *)colorWithHex: (NSString *) stringToConvert alpha:(float)opacity;

/** UIColor转成rgba */
+(NSMutableArray *)RGBAComponentsFromColor:(UIColor *)color;

/** UIColor转16进制字符串 */
+ (NSString *) changeUIColorToRGB:(UIColor *)color;
@end

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
+(NSMutableArray *)RGBComponentsFromColor:(UIColor *)color;

/** UIColor转16进制字符串 */
+ (NSMutableArray *) changeUIColorToRGB:(UIColor *)color;
@end

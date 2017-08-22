//
//  NSString+CustomFunctions.h
//  XBExtensionTest
//
//  Created by luoxj on 16/5/10.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CustomFunctions)

///根据传入的宽度和字体计算出合适的size (CGSize)
- (CGSize)xb_getAdjustSizeWithWidth:(CGFloat)width font:(UIFont *)font;

///根据传入的字体获取宽度 (CGFloat)
- (CGFloat)xb_getWidthWithFont:(UIFont *)font;

///身份证号验证
- (BOOL)xb_isValidateIdentityCard;

/**
 判断字符串内容是否为整形数
 */
- (BOOL)isPureInt;

/**
 判断字符串内容是否为浮点型数
 */
- (BOOL)isPureFloat;

/**
 判断字符串中是否有中文
 */
-(BOOL)isContainChineseStr;

/**
 如果字符串中有中文则转码,无则返回原字符串
 */
-(NSString *)stringUseNSUTF8;

/**
 去除字符串中的空格
 */
-(NSString *)removeEmptyStr;

///移除字符串中的空格和换行符
- (NSString *)xb_removeSpaceAndNewline;

///是否有空格
- (BOOL)xb_isBlank;

/**
 字符串转成NSNumber
 */
-(NSNumber *)strToNSNumber;


/**
 判断内容是否为空
 */
-(BOOL)isNullOrEmpty;

//判断密码强度
- (XBPwdStrength) judgePasswordStrength;


/**
 *  获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
 *
 *  @param 传入汉字字符串   aString
 *  @param 大写拼音首字母
 */
+ (NSString *)firstCharactor:(NSString *)aString;

/**
 *  json字符串转字典
 *
 *  @param JSONString json字符串
 */
+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;

///从url中拿到链接字符串
+ (NSString *)xb_getStringFromUrl:(NSURL *)myURL;
@end

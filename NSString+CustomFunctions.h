//
//  NSString+CustomFunctions.h
//  XBExtensionTest
//
//  Created by luoxj on 16/5/10.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CustomFunctions)

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

/**
 字符串转成NSNumber
 */
-(NSNumber *)strToNSNumber;


/**
 判断内容是否为空
 */
-(BOOL)isNullOrEmpty;


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
@end

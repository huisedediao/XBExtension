//
//  NSString+CustomFunctions.m
//  XBExtensionTest
//
//  Created by luoxj on 16/5/10.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "NSString+CustomFunctions.h"

@implementation NSString (CustomFunctions)

//判断是否为整形：
- (BOOL)isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    
    int val;
    
    return [scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：
- (BOOL)isPureFloat
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    
    float val;
    
    return[scan scanFloat:&val] && [scan isAtEnd];
}

/**
 判断字符串中是否有中文
 */
-(BOOL)isContainChineseStr
{
    for(int i=0; i< [self length];i++)
    {
        int a = [self characterAtIndex:i];
        
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}


/**
 如果字符串中有中文则转码,无则返回原字符串
 */
-(NSString *)stringUseNSUTF8
{
    if([self isContainChineseStr])//网址带中文,转码
    {
        return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    }
    return self;
}

/**
 去除字符串中的空格
 */
-(NSString *)removeEmptyStr
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

/**
 字符串转成nsnumber
 */
-(NSNumber *)strToNSNumber
{
    if ([self isPureInt])//如果是整形
    {
        return [NSNumber numberWithInt:[self intValue]];
    }
    else if([self isPureFloat])//如果是浮点型
    {
        return [NSNumber numberWithFloat:[self floatValue]];
    }
    else
    {
        return nil;
    }
}

/**
 判断内容是否为空
 */
-(BOOL)isNullOrEmpty
{
    NSString *tempStr=[self removeEmptyStr];
    
    BOOL contentIsNullOrEmpty=NO;
    
    if (tempStr==nil||tempStr.length==0)
    {
        contentIsNullOrEmpty=YES;
    }
    return contentIsNullOrEmpty;
}


/**
 *  获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
 *
 *  @param 传入汉字字符串   aString
 *  @param 大写拼音首字母
 */
+ (NSString *)firstCharactor:(NSString *)aString
{
    if (aString)
    {
        //转成了可变字符串
        NSMutableString *str = [NSMutableString stringWithString:aString];
        //先转换为带声调的拼音
        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
        //再转换为不带声调的拼音
        CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
        //转化为大写拼音
        NSString *pinYin = [str capitalizedString];
        //获取并返回首字母
        return [pinYin substringToIndex:1];
    }
    else
    {
        return aString;
    }
}

/**
 *  json字符串转字典
 *
 *  @param JSONString json字符串
 */
+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString
{
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}
@end

//
//  NSString+CustomFunctions.m
//  XBExtensionTest
//
//  Created by luoxj on 16/5/10.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "NSString+CustomFunctions.h"

@implementation NSString (CustomFunctions)

///根据传入的宽度和字体计算出合适的size (CGSize)
- (CGSize)xb_getAdjustSizeWithWidth:(CGFloat)width font:(UIFont *)font
{
    return [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :font} context:NULL].size;
}


///根据传入的字体获取宽度 (CGFloat)
- (CGFloat)xb_getWidthWithFont:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = self;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

///身份证号验证
- (BOOL)xb_isValidateIdentityCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

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

///是否有空格
- (BOOL)xb_isBlank
{
    NSRange _range = [self rangeOfString:@" "];
    if (_range.location != NSNotFound) {
        //有空格
        return YES;
    } else {
        //没有空格
        return NO;
    }
}

///移除字符串中的空格和换行符
- (NSString *)xb_removeSpaceAndNewline
{
    NSString *temp = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
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


///从url中拿到链接字符串
+ (NSString *)xb_getStringFromUrl:(NSURL *)myURL
{
    NSString *urlString = myURL.absoluteString;
    return urlString;
}

//判断密码强度
- (XBPwdStrength) judgePasswordStrength
{
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    
    NSArray* termArray1 = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];
    NSArray* termArray2 = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", nil];
    NSArray* termArray3 = [[NSArray alloc] initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    NSArray* termArray4 = [[NSArray alloc] initWithObjects:@"~",@"`",@"@",@"#",@"$",@"%",@"^",@"&",@"*",@"(",@")",@"-",@"_",@"+",@"=",@"{",@"}",@"[",@"]",@"|",@":",@";",@"“",@"'",@"‘",@"<",@",",@".",@">",@"?",@"/",@"、",@"!", nil];
    
    NSString* result1 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray1 Password:self]];
    NSString* result2 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray2 Password:self]];
    NSString* result3 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray3 Password:self]];
    NSString* result4 = [NSString stringWithFormat:@"%d",[self judgeRange:termArray4 Password:self]];
    
    [resultArray addObject:[NSString stringWithFormat:@"%@",result1]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result2]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result3]];
    [resultArray addObject:[NSString stringWithFormat:@"%@",result4]];
    
    int intResult=0;
    for (int j=0; j<[resultArray count]; j++)
    {
        if ([[resultArray objectAtIndex:j] isEqualToString:@"1"])
        {
            intResult++;
        }
    }
    XBPwdStrength result;
    if (intResult <2 || self.length<6)
    {
        result = XBPwdStrengthNon;
    }
    else if (intResult == 2 && [self length]<12)
    {
        result = XBPwdStrengthWeak;
    }
    else if ((intResult == 2 && [self length] >= 12) || (intResult >2 && self.length<12))
    {
        result = XBPwdStrengthMedium;
    }
    else if((intResult ==3 && self.length>=12) || intResult == 4)
    {
        result = XBPwdStrengthStrong;
    }
    return result;
}
//判断是否包含
- (BOOL) judgeRange:(NSArray*) _termArray Password:(NSString*) _password
{
    NSRange range;
    BOOL result =NO;
    for(int i=0; i<[_termArray count]; i++)
    {
        range = [_password rangeOfString:[_termArray objectAtIndex:i]];
        if(range.location != NSNotFound)
        {
            result =YES;
        }
    }
    return result;
}
@end

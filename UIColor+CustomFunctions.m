//
//  UIColor+CustomFunctions.m
//  XBGradientColorView
//
//  Created by xxb on 2016/11/26.
//  Copyright © 2016年 xxb. All rights reserved.
//

#import "UIColor+CustomFunctions.h"

@implementation UIColor (CustomFunctions)


+(UIColor *) colorWithHex: (NSString *) stringToConvert alpha:(float)opacity
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    if ([cString length] < 6) return [UIColor blackColor];
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];

    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:opacity];
}

+(UIColor *) colorWithHex: (NSString *) stringToConvert
{
    return [UIColor colorWithHex:stringToConvert alpha:1.0];
}


+(NSMutableArray *)RGBAComponentsFromColor:(UIColor *)color
{
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    
    NSMutableArray *resultArr=[NSMutableArray new];
    for (int component = 0; component < 4; component++)
    {
        if (component==3)
        {
            [resultArr addObject:[NSString stringWithFormat:@"%.2f",resultingPixel[component]/255.0]];
        }
        else
        {
            [resultArr addObject:[NSString stringWithFormat:@"%d",resultingPixel[component]]];
        }
    }
    return resultArr;
}

//颜色转字符串
+ (NSString *) changeUIColorToRGB:(UIColor *)color
{
    const CGFloat *cs=CGColorGetComponents(color.CGColor);

    NSString *r = [NSString stringWithFormat:@"%@",[UIColor  ToHex:cs[0]*255]];
    NSString *g = [NSString stringWithFormat:@"%@",[UIColor  ToHex:cs[1]*255]];
    NSString *b = [NSString stringWithFormat:@"%@",[UIColor  ToHex:cs[2]*255]];
    return [NSString stringWithFormat:@"#%@%@%@",r,g,b];
}
//十进制转十六进制
+(NSString *)ToHex:(int)tmpid
{
    NSString *endtmp=@"";
    NSString *nLetterValue;
    NSString *nStrat;
    int ttmpig=tmpid%16;
    int tmp=tmpid/16;
    switch (ttmpig)
    {
        case 10:
            nLetterValue =@"A";break;
        case 11:
            nLetterValue =@"B";break;
        case 12:
            nLetterValue =@"C";break;
        case 13:
            nLetterValue =@"D";break;
        case 14:
            nLetterValue =@"E";break;
        case 15:
            nLetterValue =@"F";break;
        default:nLetterValue=[[NSString alloc]initWithFormat:@"%i",ttmpig];
            
    }
    switch (tmp)
    {
        case 10:
            nStrat =@"A";break;
        case 11:
            nStrat =@"B";break;
        case 12:
            nStrat =@"C";break;
        case 13:
            nStrat =@"D";break;
        case 14:
            nStrat =@"E";break;
        case 15:
            nStrat =@"F";break;
        default:nStrat=[[NSString alloc]initWithFormat:@"%i",tmp];
            
    }
    endtmp=[[NSString alloc]initWithFormat:@"%@%@",nStrat,nLetterValue];
    return endtmp;
}
@end

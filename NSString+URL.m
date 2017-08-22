//
//  NSString+URL.m
//  UTF8Test
//
//  Created by xxb on 2017/5/5.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)
- (NSString *)URLEncodedString
{
    NSString *encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                    (CFStringRef)self,
                                                                                                    (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                                                    NULL,
                                                                                                    kCFStringEncodingUTF8));
    return encodedString;
}
@end

//
//  NSObject+AddNotice.m
//  AnXin
//
//  Created by xxb on 2018/4/14.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "NSObject+AddNotice.h"

@implementation NSObject (AddNotice)
- (void)addNoitceWithNoticeName:(NSString *)name object:(id)object
{
    NSString *selName = name;
    if ([name hasPrefix:@"XBNotice_"])
    {
        selName = [name componentsSeparatedByString:@"_"][1];
    }
    NSString *selStr = [NSString stringWithFormat:@"%@:",selName];
    SEL sel = NSSelectorFromString(selStr);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:sel name:name object:object];
}
- (void)addNoitceWithNoticeNameArr:(NSArray *)nameArr
{
    for (NSString *str in nameArr)
    {
        [self addNoitceWithNoticeName:str object:nil];
    }
}
@end

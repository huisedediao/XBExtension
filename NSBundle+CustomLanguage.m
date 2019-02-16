//
//  NSBundle+CustomLanguage.m
//  aw1_plus
//
//  Created by he yan on 26/06/2017.
//  Copyright © 2017 sven. All rights reserved.
//

#import "NSBundle+CustomLanguage.h"
#import <objc/runtime.h>

static const char routeBundle = 0;

@interface BundleNew : NSBundle
@end

@implementation BundleNew
- (NSString*)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle* bundle = objc_getAssociatedObject(self, &routeBundle);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}
@end

@implementation NSBundle (CustomLanguage)

+ (void)setLanguage:(NSString*)language
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      object_setClass([NSBundle mainBundle],[BundleNew class]);
                  });
    objc_setAssociatedObject([NSBundle mainBundle], &routeBundle, language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

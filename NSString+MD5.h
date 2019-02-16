//
//  NSString+MD5.h
//  TongMeng
//
//  Created by 谢贤彬 on 2019/2/16.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MD5)
// 32位 (较为常用)
- (NSString *)md5HashToLower32Bit;
- (NSString *)md5HashToUpper32Bit;

// 16位
- (NSString *)md5HashToLower16Bit;
- (NSString *)md5HashToUpper16Bit;
@end

NS_ASSUME_NONNULL_END

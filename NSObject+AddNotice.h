//
//  NSObject+AddNotice.h
//  AnXin
//
//  Created by xxb on 2018/4/14.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AddNotice)
- (void)addNoitceWithNoticeName:(NSString *)name object:(id)object;
- (void)addNoitceWithNoticeNameArr:(NSArray *)nameArr;
@end

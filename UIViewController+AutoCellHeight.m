//
//  UIViewController+AutoCellHeight.m
//  D11Module
//
//  Created by xxb on 2017/7/17.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "UIViewController+AutoCellHeight.h"
#import <objc/runtime.h>

@implementation UIViewController (AutoCellHeight)
- (void)setDicM_cellHeight:(NSMutableDictionary *)dicM_cellHeight
{
    // Associated : |əˈsəʊʃɪeɪt|关联的意思
    
    /*
     产生关联,让某个对象(name)与当前对象的属性(name)产生关联
     参数1: id object :表示给哪个对象添加关联
     参数2: const void *key : 表示: id类型的key值(以后用这个key来获取属性) 属性名
     参数3: id value : 属性值
     参数4: 策略, 是个枚举(点进去,解释很详细)
     */
    
    objc_setAssociatedObject(self, "dicM_cellHeight", dicM_cellHeight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (NSMutableDictionary *)dicM_cellHeight
{
    NSMutableDictionary *result = objc_getAssociatedObject(self, "dicM_cellHeight");
    if (result == nil)
    {
        result = [NSMutableDictionary new];
        //把result添加为属性，和dicM_cellHeight映射
        objc_setAssociatedObject(self, "dicM_cellHeight", result, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return result;
}


@end

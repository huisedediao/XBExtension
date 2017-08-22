//
//  NSObject+CellCusFuns.m
//  D11Module
//
//  Created by xxb on 2017/7/17.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "NSObject+CellCusFuns.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "UITableViewCell+CustomFunctions.h"

#define dicM_cellHeightsKey "dicM_cellHeights"
#define f_separatorLeadingKey "f_separatorLeading"

#define cellHeightKey [NSString stringWithFormat:@"%zd.%zd",indexPath.section,indexPath.row]

@implementation NSObject (CellCusFuns)

#pragma mark - setter 和 getter
- (void)setDicM_cellHeights:(NSMutableDictionary *)dicM_cellHeights
{
    objc_setAssociatedObject(self, dicM_cellHeightsKey, dicM_cellHeights, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)dicM_cellHeights
{
    NSMutableDictionary *result = objc_getAssociatedObject(self, "dicM_cellHeights");
    if (result == nil)
    {
        result = [NSMutableDictionary new];
        
        objc_setAssociatedObject(self, dicM_cellHeightsKey, result, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return result;
}

- (void)setF_separatorLeading:(CGFloat)f_separatorLeading
{
    objc_setAssociatedObject(self, f_separatorLeadingKey, @(f_separatorLeading), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)f_separatorLeading
{
    CGFloat re = [objc_getAssociatedObject(self, f_separatorLeadingKey) floatValue];
    return [objc_getAssociatedObject(self, f_separatorLeadingKey) floatValue];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *number = self.dicM_cellHeights[cellHeightKey];
    if (number == nil)
    {
        UITableViewCell *cell = objc_msgSend(self, sel_registerName("tableView:cellForRowAtIndexPath:"),tableView,indexPath);
        self.dicM_cellHeights[cellHeightKey] = @([cell cellAutoLayoutHeight]);
    }
    return [self.dicM_cellHeights[cellHeightKey] floatValue];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, self.f_separatorLeading, 0, 0)];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsMake(0, self.f_separatorLeading, 0, 0)];
    }
}


@end

//
//  NSObject+AutoCellHeight.m
//  D11Module
//
//  Created by xxb on 2017/7/17.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "NSObject+AutoCellHeight.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "UITableViewCell+CustomFunctions.h"

#define cellHeightKey [NSString stringWithFormat:@"%zd.%zd",indexPath.section,indexPath.row]


@implementation NSObject (AutoCellHeight)
- (void)setDicM_cellHeights:(NSMutableDictionary *)dicM_cellHeights
{
    objc_setAssociatedObject(self, "dicM_cellHeights", dicM_cellHeights, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)dicM_cellHeights
{
    NSMutableDictionary *result = objc_getAssociatedObject(self, "dicM_cellHeights");
    if (result == nil)
    {
        result = [NSMutableDictionary new];
        
        objc_setAssociatedObject(self, "dicM_cellHeights", result, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return result;
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

@end

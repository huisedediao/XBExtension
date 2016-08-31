//
//  UITableViewCell+CustomFunctions.m
//  C2B
//
//  Created by XXB on 16/6/24.
//  Copyright © 2016年 Yikang. All rights reserved.
//

#import "UITableViewCell+CustomFunctions.h"

@implementation UITableViewCell (CustomFunctions)
-(CGFloat)cellAutoLayoutHeight
{
    [self.contentView layoutIfNeeded];
    CGFloat height=[self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}
@end

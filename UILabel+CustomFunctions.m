//
//  UILabel+CustomFunctions.m
//  3.0content
//
//  Created by XXB on 16/6/1.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "UILabel+CustomFunctions.h"

@implementation UILabel (CustomFunctions)

/**
 *  设置行间距
 */
-(void)setLineSpace:(CGFloat)lineSpace text:(NSString *)text
{
    self.numberOfLines=0;
    NSString *testString = text;
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:testString];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:lineSpace];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [testString length])];
    [self setAttributedText:attributedString1];
    [self sizeToFit];
}

@end

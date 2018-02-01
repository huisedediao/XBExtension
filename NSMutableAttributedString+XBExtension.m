//
//  NSMutableAttributedString+XBExtension.m
//  XBAttributedExtension
//
//  Created by xxb on 2017/5/11.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "NSMutableAttributedString+XBExtension.h"

//根据传入的文字和字体获取宽度 (CGFloat)
#define getWidthWith_title_font(title,font) ({\
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];\
label.text = title;\
label.font = font;\
[label sizeToFit];\
label.frame.size.width;\
})



@implementation NSMutableAttributedString (XBExtension)


#pragma mark - 处理方法
-(NSRange)handleRange:(NSRange)range
{
    if ([NSStringFromRange(range) isEqualToString:NSStringFromRange(xb_textRange)])
    {
        return NSMakeRange(0, self.length);
    }
    else
    {
        return range;
    }
}



#pragma mark - 类方法

/**
 获取带有行间距和字间距的富文本
 参数1：文字
 参数2：字体
 参数3：行间距
 参数4：字间距
 */
+ (NSMutableAttributedString *)xb_getAttributedStringWithStr:(NSString*)str font:(UIFont*)font lineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    if (font)
    {
        dic[NSFontAttributeName] = font;
    }
    if (lineSpace != 0)
    {
        dic[NSParagraphStyleAttributeName] = paraStyle;
    }
    if (textSpace != 0)
    {
        //设置字间距 NSKernAttributeName:
        dic[NSKernAttributeName] = @(textSpace);
    }
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    return attributeStr;
}


/**
 计算文字的高度（带有行间距和字间距的情况）
 参数1：文字
 参数2：字体
 参数3：最长的显示宽度
 参数4：行间距
 参数5：字间距
 */
+ (CGFloat)xb_getHeightWith:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width lineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@(textSpace)
                          };

    CGSize size = [str boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    
    //这一步是为了解决：多行就没有问题，NSMutableAttributedString 设置行间距，如果只有一行的话，行高度就会多出一个行间距
    CGFloat tempWidth = getWidthWith_title_font(str, font) + (str.length - 1)* textSpace;
    if (tempWidth <= width)         return size.height - lineSpace;
    
    return size.height;
}



#pragma mark - 颜色

/**
 设置某个范围的颜色
 参数1：颜色
 参数2：显示该颜色的范围
 */
- (void)xb_setColor:(UIColor *)color range:(NSRange)range
{
    [self addAttribute:NSForegroundColorAttributeName value:color range:[self handleRange:range]];
}


/**
 设置文字背景颜色
 参数1：颜色
 参数2：显示该颜色的范围
 */
- (void)xb_setBackgroundColor:(UIColor *)color range:(NSRange)range
{
    [self addAttribute:NSBackgroundColorAttributeName value:color range:[self handleRange:range]];
}



#pragma mark - 字体


/**
 设置某个范围的字体
 参数1：字体
 参数2：显示该字体的防伪
 */
- (void)xb_setFont:(UIFont *)font range:(NSRange)range
{
    [self addAttribute:NSFontAttributeName value:font range:[self handleRange:range]];
}



#pragma mark - 间距

/**
 设置文字行间距
 参数：间距
 */
- (void)xb_setLineSpace:(CGFloat)lineSpace range:(NSRange)range
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    
    [self addAttribute:NSParagraphStyleAttributeName value:paraStyle range:[self handleRange:range]];
}

/**
 设置文字字间距
 参数：间距
 */
- (void)xb_setTextSpace:(CGFloat)textSpace range:(NSRange)range
{
    [self addAttribute:NSKernAttributeName value:@(textSpace) range:[self handleRange:range]];
}




#pragma mark - 下划线

/**
 设置下划线的样式 （下划线的粗细跟随最大的文字）
 参数1：样式
 参数2：范围
 */
- (void)xb_setUnderlineStyle:(NSUnderlineStyle)style range:(NSRange)range
{
    [self addAttribute:NSUnderlineStyleAttributeName value:@(style) range:[self handleRange:range]];
}

/**
 设置下划线的颜色
 参数1：颜色
 参数2：范围
 */
- (void)xb_setUnderlineColor:(UIColor *)color range:(NSRange)range
{
    [self addAttribute:NSUnderlineColorAttributeName value:color range:[self handleRange:range]];
}


#pragma mark - 删除线


/**
 设置删除线的样式 
 参数1：样式
 参数2：范围
 */
- (void)xb_setDeletelineStyle:(NSUnderlineStyle)style range:(NSRange)range
{
    //ios 10.3无效
//    [self addAttribute:NSStrikethroughStyleAttributeName value:@(style) range:[self handleRange:range]];
    
    [self addAttributes:@{
                             NSStrikethroughStyleAttributeName:@(style),
                             NSBaselineOffsetAttributeName:@(0)
                             }
                  range:[self handleRange:range]];
}


/**
 设置删除线的颜色
 参数1：颜色
 参数2：范围
 */
- (void)xb_setDeletelineColor:(UIColor *)color range:(NSRange)range
{
    //ios 10.3无效
//    [self addAttribute:NSStrikethroughColorAttributeName value:color range:[self handleRange:range]];
    
    [self addAttributes:@{
                          NSForegroundColorAttributeName:color,
                          NSBaselineOffsetAttributeName:@(0)
                          }
                  range:[self handleRange:range]];
}

/**
 设置空心的颜色
 参数1：颜色
 参数2：范围
 */
- (void)xb_setStrokeColor:(UIColor *)color range:(NSRange)range;
{
    [self addAttribute:NSStrokeColorAttributeName value:color range:[self handleRange:range]];
}

/**
 设置空心的宽度
 参数1：宽度 （正数为空心，负数为加粗）
 参数2：范围
 */
- (void)xb_setStrokeWidth:(CGFloat)width range:(NSRange)range
{
    [self addAttribute:NSStrokeWidthAttributeName value:@(width) range:[self handleRange:range]];
}




#pragma mark - 偏移
/**
 设置上下偏移
 参数1：偏移的量（正数：向上偏移，负数：向下偏移）
 参数2：范围
 */
- (void)xb_setOffset:(CGFloat)offset range:(NSRange)range
{
    [self addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:[self handleRange:range]];
}


#pragma mark - 倾斜

/**
 设置字形倾斜度，正值右倾，负值左倾
 参数：倾斜度
 */
- (void)xb_setTilt:(CGFloat)tilt range:(NSRange)range
{
    [self addAttribute:NSObliquenessAttributeName value:@(tilt) range:[self handleRange:range]];
}


#pragma mark - 拉伸

/**
 横向拉伸或压缩文本：正值横向拉伸文本，负值横向压缩文本
 参数1：拉伸值
 参数2：范围
 */
- (void)xb_setExpansion:(CGFloat)expansion range:(NSRange)range
{
    [self addAttribute:NSExpansionAttributeName value:@(expansion) range:[self handleRange:range]];
}


//#pragma mark - 文字书写方向
//
///**
// 设置文字书写方向
// 参数1：0：从左向右，1：从右向左
// 参数2：范围
// */
//- (void)xb_setWritingDirection:(NSWritingDirection)direction range:(NSRange)range
//{
//    [self addAttribute:NSWritingDirectionAttributeName value:@(direction) range:[self handleRange:range]];
//}

#pragma mark - 设置纵向方向

/**
 设置文字书写方向
 参数1：0 表示横排文本，1 表示竖排文本
 参数2：范围
 */
//- (void)xb_setVerticalDirection:(int)direction range:(NSRange)range
//{
//    [self addAttribute:NSVerticalGlyphFormAttributeName value:@(direction) range:[self handleRange:range]];
//}



@end

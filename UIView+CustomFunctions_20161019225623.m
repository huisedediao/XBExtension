//
//  UIView+CustomFunctions.m
//  test
//
//  Created by XXB on 16/5/8.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "UIView+CustomFunctions.h"

@implementation UIView (CustomFunctions)

/**
 判断是不是某个view的子view
 */
-(BOOL)isSubViewOfView:(UIView *)fatherView
{
    BOOL isSubView=NO;
    
    NSArray *subViews=fatherView.subviews;
    
    for (UIView *subView in subViews)
    {
        if (subView==self)
        {
            isSubView=YES;
            
            break;
        }
    }
    
    return isSubView;
}


/**
 自身的高度
 */
-(CGFloat)height
{
    return self.bounds.size.height;
}


/**
 自身的宽度
 */
-(CGFloat)width
{
    return self.bounds.size.width;
}


/**
 ** lineLength:	 虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:	  虚线的颜色
 **/
-(void)drawDashLineLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(self.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(self.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [self.layer addSublayer:shapeLayer];
}

@end

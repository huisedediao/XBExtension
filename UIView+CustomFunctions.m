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
-(BOOL)xb_isSubViewOfView:(UIView *)fatherView
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
-(CGFloat)xb_height
{
    return self.bounds.size.height;
}


/**
 自身的宽度
 */
-(CGFloat)xb_width
{
    return self.bounds.size.width;
}


/**
 ** lineLength:	 虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:	  虚线的颜色
 **/
-(void)xb_drawDashLineLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
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


/*
 *  添加模糊效果
 *  参数1：图片
 *  参数2：模糊程度
 *  参数3：黑色还是白色，默认黑；0：黑，1：白
 */
-(void)xb_addBlurwithNumber:(CGFloat)blur type:(NSInteger)type
{
    [self layoutIfNeeded];
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:self.bounds];
    toolbar.barStyle = type==0?UIBarStyleBlackTranslucent:UIBarStyleDefault;
    toolbar.alpha=blur;
    [self addSubview:toolbar];
}


/*
 *  自身的截图
 */
- (UIImage *)xb_imageShot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end

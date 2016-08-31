//
//  UIImageView+UITouch.m
//  3.0content
//
//  Created by XXB on 16/6/2.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "UIImageView+UITouch.h"

@implementation UIImageView (UITouch)

/*----------------------------解决点击UIImageView(或者UIImageView子类touchesBegan不响应问题)--------------------------------*/
//如果 userInteractionEnabled=YES; 则UIImageView自己响应点击事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}
/*----------------------------解决点击UIImageView(或者UIImageView子类touchesBegan不响应问题)--------------------------------*/
@end

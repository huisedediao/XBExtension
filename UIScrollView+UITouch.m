//
//  UIScrollView+UITouch.m
//  3.0content
//
//  Created by XXB on 16/6/2.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "UIScrollView+UITouch.h"

@implementation UIScrollView (UITouch)

/*----------------------------解决点击scrollView(或者scrollView子类touchesBegan不响应问题)--------------------------------*/
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
/*----------------------------解决点击scrollView(或者scrollView子类touchesBegan不响应问题)--------------------------------*/
@end

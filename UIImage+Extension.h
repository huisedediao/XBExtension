//
//  UIImage+Extension.h
//  smanos
//
//  Created by abovelink on 2018/12/20.
//  Copyright © 2018年 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage*)imageWithColor:(UIColor*)color;

//设置图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha image:(UIImage*)image;

// 把图片改变颜色
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;

//获取视频某时刻的一贞图片
+ (UIImage*) thumbnailImageForVideoPath:(NSString *)videoPath atTime:(NSTimeInterval)time;

//改变图片颜色
+ (UIImage *)imageWithColor:(UIColor *)color image:(UIImage *)image alpha:(CGFloat)alpha;

@end

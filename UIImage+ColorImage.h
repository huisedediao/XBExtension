//
//  UIImage+ColorImage.h
//  smanos
//
//  Created by sven on 3/23/16.
//  Copyright © 2016 sven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorImage)
+ (UIImage*)imageWithColor:(UIColor*)color;

//设置图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha image:(UIImage*)image;

//改变图片尺寸
//-(UIImage*)scaleToSize:(CGSize)size;

// 把图片改变颜色
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;

// 获取视频数据的第一贞图片
+ (UIImage*) thumbnailImageForVideoPath:(NSString *)videoPath atTime:(NSTimeInterval)time;
@end

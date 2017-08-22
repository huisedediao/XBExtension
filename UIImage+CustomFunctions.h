//
//  UIImage+CustomFunctions.h
//  XBExtensionTest
//
//  Created by luoxj on 16/5/11.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CustomFunctions)
/**
 用传进来的UIEdgeInsets区域去填充拉伸图片,返回边角不变的图片
 */
-(UIImage *)resizableWithcapInsets:(UIEdgeInsets)capInsets;


/**
 调整尺寸
 */
- (UIImage *)scaledToSize:(CGSize)newSize;


/**
 * 截取选定的区域,返回截取的图片
 */
- (UIImage *)cuttingRect:(CGRect)rect;

///获取某点的颜色
- (UIColor *)xb_getColorForPoint:(CGPoint)point;

///UIImage和base64互转
- (NSString *)encodeToBase64String:(UIImage *)image;

///UIImage和base64互转
- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData;

/**
 *  打水印
 *
 *  @param bg   背景图片
 *  @param logo 右下角的水印图片
 *  @param logoScale 水印图片缩放比例
 *  @param margin 水印距离图片边缘的距离
 */
+ (instancetype)waterImageWithBg:(NSString *)bg logo:(NSString *)logo logoScale:(CGFloat)logoScale margin:(CGFloat)margin;

/**
 *  对于不合规定大小或者比例的图片裁剪中间部分，或者按比例缩小
 *
 *  @param originalImage 原图
 *  @param size          截取尺寸
 *
 *  @return 截图后的图片
 */
+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size;

/*
 *  根据色值生成图片
 */
+(UIImage *)generateImagesBasedOnColorValues:(UIColor *)color size:(CGSize)size;
@end

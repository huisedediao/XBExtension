//
//  XBCommonAction.h
//  masonry_test
//
//  Created by Mac on 2/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

/****打印方法****/
#ifdef DEBUG //处于调试阶段,打印
#define XBNSlog(...) NSLog(__VA_ARGS__)
#else   //发布阶段,不打印
#define XBNSlog(...)
#endif
/****打印方法****/


/******宏******/
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
/******宏******/

@interface XBCommonAction : UIViewController

/**
 根据传入的width获取size
 */
+(CGSize)getSizeWithWidth:(CGFloat)width proportion:(CGFloat)proportion;

/**
 根据传入的文字和字体获取宽度
 */
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

/**
 获取随机颜色
 */
+(UIColor *)randomColor;

/**
 根据文件名获取完整的沙盒路径(Documents文件夹下)
 */
+(NSString *)pathForSandboxDocumentsWith:(NSString *)fileName;

/**
 开启状态栏菊花
 */
+(void)startNetworkActivityIndicator;

/**
 关闭状态栏菊花
 */
+(void)stopNetworkActivityIndicator;

/**
 查询是否已经登陆
 */
+(BOOL)isDidLogin;

/**
 用userDefault存储信息
 */
+(void)userDefaultsSetObject:(id)object forKey:(NSString *)key;

/**
 读取userDefault存储的信息
 */
+(id)userDefaultsObjectForKey:(NSString *)key;

/**
 解析json
 */
+(id)JSONObjectWithData:(NSData *)data;

/**
 网址中文转码
 */
+(NSString *)stringUseNSUTF8:(NSString *)str;

/**
 判断字符串中是否有中文
 */
+(BOOL)isChineseStr:(NSString *)str;

/**
 根据图形的size,计算出让图形处在屏幕中心的origin
 */
+(CGPoint)originForCenterWithSize:(CGSize)size;
@end

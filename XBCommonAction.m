//
//  XBCommonAction.m
//  masonry_test
//
//  Created by Mac on 2/7/16.
//  Copyright © 2016 Mac. All rights reserved.
//

#import "XBCommonAction.h"

@interface XBCommonAction ()

@end

@implementation XBCommonAction

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - actions

//根据宽度和比例获取size
+(CGSize)getSizeWithWidth:(CGFloat)width proportion:(CGFloat)proportion
{
    CGFloat height=width/proportion;
    return CGSizeMake(width, height);
}

/**
 根据传入的文字和字体获取宽度
 */
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

//产生随机颜色
+(UIColor *)randomColor
{
    UIColor *color=[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    return color;
}

/**
 根据文件名获取完整的沙盒路径(Documents文件夹下)
 */
+(NSString *)pathForSandboxDocumentsWith:(NSString *)fileName
{
    NSString *sandboxPath=[NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),fileName];
    return sandboxPath;
}

/**
 开启状态栏菊花
 */
+(void)startNetworkActivityIndicator
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

/**
 关闭状态栏菊花
 */
+(void)stopNetworkActivityIndicator
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

/**
 查询是否已经登陆
 */
+(BOOL)isDidLogin
{
    NSString *str=[NSKeyedUnarchiver unarchiveObjectWithFile:[XBCommonAction pathForSandboxDocumentsWith:@"logined"]];
    if ([str isEqualToString:@"1"]) {
        return YES;
    }
    return NO;
}

/**
 用userDefault存储信息
 */
+(void)userDefaultsSetObject:(id)object forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
}

/**
 读取userDefault存储的信息
 */
+(id)userDefaultsObjectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

/**
 解析json
 */
+(id)JSONObjectWithData:(NSData *)data
{
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

/**
 网址中文转码
 */
+(NSString *)stringUseNSUTF8:(NSString *)str
{
    if([XBCommonAction isChineseStr:str])//网址带中文,转码
    {
        return [[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

/**
 判断字符串中是否有中文
 */
+(BOOL)isChineseStr:(NSString *)str
{
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

/**
 根据图形的size,计算出让图形处在屏幕中心的origin
 */
+(CGPoint)originForCenterWithSize:(CGSize)size
{
    CGFloat width=size.width;
    CGFloat height=size.height;
    CGFloat x=(screenWidth-width)/2.0;
    CGFloat y=(screenHeight-height)/2.0;
    return CGPointMake(x, y);
}

@end

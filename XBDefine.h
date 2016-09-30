//
//  XBDefine.h
//  XBExtensionTest
//
//  Created by luoxj on 16/5/10.
//  Copyright © 2016年 XXB. All rights reserved.
//

#ifndef XBDefine_h
#define XBDefine_h


/********************枚举********************/
typedef enum
{
    XBLCRSideCenter=0,   //居中
    XBLCRSideLeft,       //左
    XBLCRSideRight       //右
    
}XBLCRSide;

typedef enum
{
    XBSideTop = 0,    //上
    XBSideBottom,     //下
    XBSideLeft,       //左
    XBSideRight       //右
    
}XBSide;
/********************枚举********************/



/********************打印方法********************/

/****不打印当前所在方法****/
#ifdef DEBUG //处于调试阶段,打印
#define NSLog(...) NSLog(__VA_ARGS__)
#else   //发布阶段,不打印
#define NSLog(...)
#endif
/****不打印当前所在方法****/

/****打印当前所在方法****/
#ifdef DEBUG //处于调试阶段,打印
#define XBFlog(...) NSLog(@"\n%s\n %@\n\n",__func__,[NSString stringWithFormat:__VA_ARGS__])
#else   //发布阶段,不打印
#define XBFlog(...)
#endif
/****打印当前所在方法****/

/********************打印方法********************/


/**********************************宏**********************************/
//字符串是否为空
#define StringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

//数组是否为空
#define ArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

//字典是否为空
#define DictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

//是否是空对象
#define ObjectIsEmpty(_object) (_object == nil \|| [_object isKindOfClass:[NSNull class]] \|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


#define UserDefault [NSUserDefaults standardUserDefaults]
#define Application        [UIApplication sharedApplication]
#define KeyWindow          [UIApplication sharedApplication].keyWindow
#define CurrentAppDelegate        [UIApplication sharedApplication].delegate
#define FileManager  [NSFileManager defaultManager]

//屏幕宽高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//随机色
#define RandColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0]

//RGB颜色
#define ColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]



//状态栏高度
#define StatusBarHeight    [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏高度
#define NavigationBarHeight    self.navigationController.navigationBar.frame.size.height
//顶部状态栏+导航栏
#define TopBarHeight StatusBarHeight + NavigationBarHeight

//系统版本
#define SystemVersion [[UIDevice currentDevice].systemVersion doubleValue]
//系统版本是否大于IOS7
#define IOS7 SystemVersion >= 7.0

//APP版本号
#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断是否为iPhone
#define ISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define ISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//本地化相关
#define STR(x) NSLocalizedString(x,nil)

//角度转成弧度
#define Angle2Radian(angle) ((angle) / 180.0 * M_PI)
//由弧度转换角度
#define Radian2Angle(radian) (radian * 180.0) / (M_PI)

//获取一段时间间隔
#define StartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define EndTime   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

//设备判断
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//block weak属性化self宏
#define WEAK_SELF __typeof(self) __weak weakSelf = self;

#define UseCanTouch   [[[UIApplication sharedApplication] keyWindow] setUserInteractionEnabled:YES];
#define UseNoCanTouch [[[UIApplication sharedApplication] keyWindow] setUserInteractionEnabled:NO];

//获取沙盒Document路径
#define DocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒temp路径
#define TempPath NSTemporaryDirectory()

//获取沙盒Cache路径
#define CachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//判断是真机还是模拟器
#if TARGET_OS_IPHONE//真机
#endif
#if TARGET_IPHONE_SIMULATOR
//模拟器
#endif

/**********************************宏**********************************/



#endif /* XBDefine_h */

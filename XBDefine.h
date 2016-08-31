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
#define XBlog(...) NSLog(__VA_ARGS__)
#else   //发布阶段,不打印
#define XBlog(...)
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
//屏幕宽高
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

//随机色
#define RandColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0]

//RGB颜色
#define ColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//userDefault
#define UserDefault [NSUserDefaults standardUserDefaults]

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

//本地化相关
#define STR(x) NSLocalizedString(x,nil)

//角度转成弧度
#define Angle2Radian(angle) ((angle) / 180.0 * M_PI)

//设备判断
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//block weak属性化self宏
#define WEAK_SELF __typeof(self) __weak weakSelf = self;

/**********************************宏**********************************/



#endif /* XBDefine_h */

//
//  UINavigationController+ClearNavigationBar.h
//  3.0content
//
//  Created by XXB on 16/5/30.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CustomFunctions)

#pragma mark - navigationBar透明相关
/**
 *  设置navigationBar的透明度
 */
-(void)setAlph:(CGFloat)alpha;
/**
 *  用于设置背景透明度的view
 */
-(UIView *)apphaView;
/**
 *  navigationBar增加透明效果,结合setAlph使用
 */
-(void)clearColorNavigationControllerWith:(UIColor *)alphaColor;
/**
 *  设置navigationBar的title的颜色
 */
-(void)setTitleColor:(UIColor *)titleColor;


#pragma mark - 移除viewControllers中的某个vc
/**
 *  移除viewControllers中的某个vc
 */
-(void)removeVCFromViewControllers:(NSString *)viewControllerToRemoveClassName;



#pragma mark - navigationBarButtonItem
+(UIBarButtonItem *)navigationBarButtonItemWithText:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents tag:(NSInteger)tag;


+(NSArray *)navigationBarButtonItemAndButtonWithText:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents tag:(NSInteger)tag;

@end

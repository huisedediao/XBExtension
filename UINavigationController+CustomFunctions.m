//
//  UINavigationController+ClearNavigationBar.m
//  3.0content
//
//  Created by XXB on 16/5/30.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "UINavigationController+CustomFunctions.h"
#import "XBPublicFunctions.h"

@implementation UINavigationController (CustomFunctions)

/**
 *  navigationBar增加透明效果,结合setAlph使用
 */
-(void)clearColorNavigationControllerWith:(UIColor *)alphaColor
{
    CGRect frame = self.navigationBar.frame;
    if ([self.view viewWithTag:100100100]==nil)
    {
        UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height+20)];
        
        //分割线
        UIView *lineView=[UIView new];
        lineView.backgroundColor=[[UIColor grayColor] colorWithAlphaComponent:0.7];
        [alphaView addSubview:lineView];
        lineView.frame=CGRectMake(0, frame.size.height+19.5,  frame.size.width, 0.5);
        
        alphaView.backgroundColor = alphaColor;
        alphaView.tag=100100100;
        [self.view insertSubview:alphaView belowSubview:self.navigationBar];
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow.png"] forBarMetrics:UIBarMetricsCompact];
        self.navigationBar.layer.masksToBounds = YES;
    }
}
/**
 *  用于设置背景透明度的view
 */
-(UIView *)apphaView
{
    UIView *apphaView=[self.view viewWithTag:100100100];
    return apphaView;
}

/**
 *  设置navigationBar的透明度
 */
-(void)setAlph:(CGFloat)alpha
{
    [[self.view viewWithTag:100100100] setAlpha:alpha];
}


/**
 *  设置navigationBar的title的颜色
 */
-(void)setTitleColor:(UIColor *)titleColor
{
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:titleColor forKey:NSForegroundColorAttributeName];
    
    //大功告成
    self.navigationBar.titleTextAttributes = dict;
}


/**
 *  移除viewControllers中的某个vc
 */
-(void)removeVCFromViewControllers:(NSString *)viewControllerToRemoveClassName;
{
    NSArray *vcs=self.viewControllers;
    NSMutableArray *tempArrM=[NSMutableArray new];
    for (UIViewController *vc in vcs)
    {
        if (![vc isKindOfClass:NSClassFromString(viewControllerToRemoveClassName)])
        {
            [tempArrM addObject:vc];
        }
    }
    [self setViewControllers:tempArrM];
}



#pragma mark - navigationBarButtonItem
+(UIBarButtonItem *)navigationBarButtonItemWithText:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents tag:(NSInteger)tag
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font=textFont?textFont:[UIFont systemFontOfSize:15];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor?textColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:controlEvents];
    button.tag=tag;
    //    button.backgroundColor=[UIColor redColor];
    
    button.frame=CGRectMake(0, 0, [XBPublicFunctions getWidthWithTitle:text font:button.titleLabel.font]+10, 44);
    
    UIBarButtonItem *barButtonItem=[[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButtonItem;
}
+(NSArray *)navigationBarButtonItemAndButtonWithText:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents tag:(NSInteger)tag
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font=textFont?textFont:[UIFont systemFontOfSize:15];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor?textColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:controlEvents];
    button.tag=tag;
    //    button.backgroundColor=[UIColor redColor];
    
    button.frame=CGRectMake(0, 0, [XBPublicFunctions getWidthWithTitle:text font:button.titleLabel.font]+10, 44);
    
    UIBarButtonItem *barButtonItem=[[UIBarButtonItem alloc] initWithCustomView:button];
    
    return @[barButtonItem,button];
}
@end

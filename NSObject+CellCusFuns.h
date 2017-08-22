//
//  NSObject+CellCusFuns.h
//  D11Module
//
//  Created by xxb on 2017/7/17.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (CellCusFuns)

@property (nonatomic,strong) NSMutableDictionary *dicM_cellHeights;

//cell分割线的起始位置
@property (nonatomic,assign) CGFloat f_separatorLeading;

@end

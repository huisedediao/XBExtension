//
//  UIView+FrameLayout.m
//  test
//
//  Created by XXB on 16/5/7.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "UIView+FrameLayout.h"

@implementation UIView (FrameLayout)
/**
 根据传入的size和rect，算出这个size要处于rect的中央所需要的rect
 */
+(CGRect)xb_getRectOfSize:(CGSize)size sameCenterWithRect:(CGRect)rect
{
    CGRect resultRect;
    resultRect.origin.x=(rect.size.width-size.width)*0.5;
    resultRect.origin.y=(rect.size.height-size.height)*0.5;
    resultRect.size=size;
    return resultRect;
}


/**
 自身的高度
 */
-(CGFloat)xb_height
{
    return self.bounds.size.height;
}
/**
 自身的宽度
 */
-(CGFloat)xb_width
{
    return self.bounds.size.width;
}


/**
 中心点位置
 */
-(CGPoint)xb_center
{
    return CGPointMake([self xb_left]+[self xb_width]*0.5, [self xb_top]+[self xb_height]*0.5);
}


/**
 自身的size
 */
-(CGSize)xb_size
{
    return CGSizeMake([self xb_width], [self xb_height]);
}


/**
 最小的x值
 */
-(CGFloat)xb_left
{
    return CGRectGetMinX(self.frame);
}

/**
 最大的x值
 */
-(CGFloat)xb_right
{
    return CGRectGetMaxX(self.frame);
}

/**
 最小的y值
 */
-(CGFloat)xb_top
{
    return CGRectGetMinY(self.frame);
}

/**
 最大的y值
 */
-(CGFloat)xb_bottom
{
    return CGRectGetMaxY(self.frame);
}

/**
 所有subView中,最大的maxX
 */
-(CGFloat)xb_maxXOfSubviews
{
    CGFloat maxX=0;
    
    for (UIView *subV in self.subviews)
    {
        CGFloat subVmaxX=CGRectGetMaxX(subV.frame);
        
        if (subVmaxX>maxX)
        {
            maxX=subVmaxX;
        }
    }
    
    return maxX;
}


/**
 所有subView中,最大的maxY
 */
-(CGFloat)xb_maxYOfSubviews
{
    CGFloat maxY=0;
    
    for (UIView *subV in self.subviews)
    {
        CGFloat subVmaxY=CGRectGetMaxY(subV.frame);
        
        if (subVmaxY>maxY)
        {
            maxY=subVmaxY;
        }
    }
    
    return maxY;
}


/**
 左边距离选定view的左边或者右边的距离
 参数1:距离
 参数2:参考view
 参数3:左边还是右边
 */
-(void)xb_leftSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side
{
    CGRect tempRect=self.frame;
    
    CGFloat selfX;
    
    switch (side)
    {
        case XBSideLeft:
            
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfX=space;
            }
            else
            {
                selfX=CGRectGetMinX(view.frame)+space;
            }
            
            break;
            
            
        case XBSideRight:
            
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfX=[view xb_width]+space;
            }
            else
            {
                selfX=CGRectGetMaxX(view.frame)+space;
            }
            
            break;
            
            
        default:
            break;
    }
    
    tempRect.origin.x=selfX;
    
    self.frame=tempRect;
}


/**
 右边距离选定view的左边或者右边的距离
 注意:设置此项之前必须设置左边距
 参数1:距离
 参数2:参考view
 参数3:左边还是右边
 */
-(void)xb_rightSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side
{
    CGRect tempRect=self.frame;
    
    CGFloat selfW;
    CGFloat selfMaxX;
    
    switch (side)
    {
        case XBSideLeft:
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfMaxX=space;
            }
            else
            {
                selfMaxX=CGRectGetMinX(view.frame)+space;
            }
            
            break;
            
            
        case XBSideRight:
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfMaxX=[view xb_width]+space;
            }
            else
            {
                selfMaxX=CGRectGetMaxX(view.frame)+space;
            }
            
            break;
            
            
        default:
            break;
    }
    
    selfW=selfMaxX-tempRect.origin.x;
    
    tempRect.size.width=selfW;
    
    self.frame=tempRect;
}


/**
 右边距离选定view的左边或者右边的距离
 注意:设置此项之前必须设置左边距
 参数1:距离,正数为参照view的那一边向右,负数向左
 参数2:参考view
 参数3:左边还是右边
 参数4:左边的值
 */
//-(void)xb_rightSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side left:(CGFloat)viewLeft
//{
//    CGRect tempRect=self.frame;
//
//    tempRect.origin.x=viewLeft;
//
//    CGFloat selfW;
//    CGFloat selfMaxX;
//
//    switch (side)
//    {
//        case left:
//
//            selfMaxX=CGRectGetMinX(view.frame)+space;
//
//            break;
//
//
//        case right:
//
//            selfMaxX=CGRectGetMaxX(view.frame)+space;
//
//            break;
//
//
//        default:
//            break;
//    }
//
//    selfW=selfMaxX-tempRect.origin.x;
//
//    tempRect.size.width=selfW;
//
//    self.frame=tempRect;
//}


/**
 右边距离选定view的左边或者右边的距离
 注意:设置此项之前必须设置左边距
 参数1:距离,正数为参照view的那一边向右,负数向左
 参数2:参考view
 参数3:左边还是右边
 参数4:宽度
 */
-(void)xb_rightSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side width:(CGFloat)viewWidth
{
    CGRect tempRect=self.frame;
    
    CGFloat selfX;
    CGFloat selfW;
    CGFloat selfMaxX;
    
    switch (side)
    {
        case XBSideLeft:
            
            //            if([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfMaxX=space;
            }
            else
            {
                selfMaxX=CGRectGetMinX(view.frame)+space;
            }
            
            break;
            
            
        case XBSideRight:
            
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfMaxX=[view xb_width]+space;
            }
            else
            {
                selfMaxX=CGRectGetMaxX(view.frame)+space;
            }
            
            break;
            
            
        default:
            break;
    }
    
    selfX=selfMaxX - viewWidth;
    
    tempRect.origin.x=selfX;
    
    selfW=selfMaxX-tempRect.origin.x;
    
    tempRect.size.width=selfW;
    
    self.frame=tempRect;
}


/**
 顶边距离选定view的上边或者底边的距离
 参数1:距离
 参数2:参考view
 参数3:上边还是下边
 */
-(void)xb_topSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side
{
    CGRect tempRect=self.frame;
    
    CGFloat selfY;
    
    switch (side)
    {
        case XBSideTop:
            
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfY=space;
            }
            else
            {
                selfY=CGRectGetMinY(view.frame)+space;
            }
            
            
            break;
            
            
        case XBSideBottom:
            
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfY=[view xb_height]+space;
            }
            else
            {
                selfY=CGRectGetMaxY(view.frame)+space;
            }
            
            
            break;
            
            
        default:
            break;
    }
    
    tempRect.origin.y=selfY;
    
    self.frame=tempRect;
}


/**
 底边距离选定view的左边或者右边的距离
 注意:设置此项之前必须设置顶边距
 参数1:距离
 参数2:参考view
 参数3:上边还是下边
 */
-(void)xb_bottomSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side
{
    CGRect tempRect=self.frame;
    
    CGFloat selfH;
    CGFloat selfMaxY;
    
    switch (side)
    {
        case XBSideTop:
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfMaxY=space;
            }
            else
            {
                selfMaxY=CGRectGetMinY(view.frame)+space;
            }
            
            break;
            
            
        case XBSideBottom:
            
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfMaxY=[view xb_height]+space;
            }
            else
            {
                selfMaxY=CGRectGetMaxY(view.frame)+space;
            }
            
            
            break;
            
            
        default:
            break;
    }
    
    selfH=selfMaxY-tempRect.origin.y;
    
    tempRect.size.height=selfH;
    
    self.frame=tempRect;
}



/**
 底边距离选定view的左边或者右边的距离
 注意:设置此项之前必须设置顶边距
 参数1:距离,正数为参照view的那一边向下,负数向上
 参数2:参考view
 参数3:上边还是下边
 参数4:高度
 */
-(void)xb_bottomSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side height:(CGFloat)viewHeight
{
    CGRect tempRect=self.frame;
    
    CGFloat selfY;
    CGFloat selfH;
    CGFloat selfMaxY;
    
    switch (side)
    {
        case XBSideTop:
            
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfMaxY=space;
            }
            else
            {
                selfMaxY=CGRectGetMinY(view.frame)+space;
            }
            
            
            break;
            
            
        case XBSideBottom:
            
            //            if ([self isSubViewOfView:view])
            if (isSubViewOfView_subV_fatherV(self, view))
            {
                selfMaxY=[view xb_height]+space;
            }
            else
            {
                selfMaxY=CGRectGetMaxY(view.frame)+space;
            }
            
            
            break;
            
            
        default:
            break;
    }
    
    selfY=selfMaxY-viewHeight;
    
    tempRect.origin.y=selfY;
    
    selfH=selfMaxY-tempRect.origin.y;
    
    tempRect.size.height=selfH;
    
    self.frame=tempRect;
}


/**
 底边距离选定view的左边或者右边的距离
 注意:设置此项之前必须设置顶边距
 参数1:距离,正数为参照view的那一边向下,负数向上
 参数2:参考view
 参数3:上边还是下边
 参数4:顶部的值
 */
//-(void)xb_bottomSpace:(CGFloat)space toView:(UIView *)view side:(XBSide)side top:(CGFloat)viewTop
//{
//    CGRect tempRect=self.frame;
//
//    tempRect.origin.y=viewTop;
//
//    CGFloat selfH;
//    CGFloat selfMaxY;
//
//    switch (side)
//    {
//        case top:
//
//            selfMaxY=CGRectGetMinY(view.frame)+space;
//
//            break;
//
//
//        case bottom:
//
//            selfMaxY=CGRectGetMaxY(view.frame)+space;
//
//            break;
//
//
//        default:
//            break;
//    }
//
//    selfH=selfMaxY-tempRect.origin.y;
//
//    tempRect.size.height=selfH;
//
//    self.frame=tempRect;
//}


/**
 左边的位置
 */
-(void)xb_left:(CGFloat)viewLeft
{
    CGRect tempRect=self.frame;
    
    tempRect.origin.x=viewLeft;
    
    self.frame=tempRect;
}


/**
 左边的位置
 */
-(void)xb_leftEqualTo:(UIView *)view
{
    CGRect tempRect=self.frame;
    
    //            if ([self isSubViewOfView:view])
    if (isSubViewOfView_subV_fatherV(self, view))
    {
        tempRect.origin.x=0;
    }
    else
    {
        tempRect.origin.x=view.frame.origin.x;
    }
    
    self.frame=tempRect;
}


/**
 右边的位置
 注意:设置此项前,先设置left
 */
-(void)xb_right:(CGFloat)viewRight
{
    CGRect tempRect=self.frame;
    
    CGFloat selfW;
    
    CGFloat selfMaxX=viewRight;
    
    selfW=selfMaxX-tempRect.origin.x;
    
    tempRect.size.width=selfW;
    
    self.frame=tempRect;
}


/**
 右边的位置
 注意:设置此项前,先设置left
 */
-(void)xb_rightEqualTo:(UIView *)view
{
    CGRect tempRect=self.frame;
    
    CGFloat selfW;
    CGFloat selfMaxX;
    
    //            if ([self isSubViewOfView:view])
    if (isSubViewOfView_subV_fatherV(self, view))
    {
        selfMaxX=[view xb_width];
    }
    else
    {
        selfMaxX=CGRectGetMaxX(view.frame);
    }
    
    selfW=selfMaxX-tempRect.origin.x;
    
    tempRect.size.width=selfW;
    
    self.frame=tempRect;
}



-(void)xb_right:(CGFloat)viewRight width:(CGFloat)width
{
    CGRect tempRect=self.frame;
    
    CGFloat selfMaxX=viewRight;
    
    CGFloat selfX=selfMaxX - width;
    
    tempRect.origin.x=selfX;
    
    tempRect.size.width=width;
    
    self.frame=tempRect;
}


/**
 右边的位置,左边的位置
 */
//-(void)xb_right:(CGFloat)viewRight left:(CGFloat)viewLeft
//{
//    CGRect tempRect=self.frame;
//
//    CGFloat selfMaxX=viewRight;
//
//    CGFloat selfW=selfMaxX - viewLeft;
//
//    tempRect.size.width=selfW;
//
//    tempRect.origin.x=viewLeft;
//
//    self.frame=tempRect;
//}


/**
 顶边的位置
 */
-(void)xb_top:(CGFloat)viewTop
{
    CGRect tempRect=self.frame;
    
    tempRect.origin.y=viewTop;
    
    self.frame=tempRect;
}


/**
 顶边的位置
 */
-(void)xb_topEqualTo:(UIView *)view
{
    CGRect tempRect=self.frame;
    
    //            if ([self isSubViewOfView:view])
    if (isSubViewOfView_subV_fatherV(self, view))
    {
        tempRect.origin.y=0;
    }
    else
    {
        tempRect.origin.y=view.frame.origin.y;
    }
    
    self.frame=tempRect;
}


/**
 底边的位置,传view或者NSNumber
 注意:设置此项前先设置top
 */
-(void)xb_bottom:(CGFloat)viewBottom
{
    CGRect tempRect=self.frame;
    
    CGFloat selfH;
    
    CGFloat selfMaxY=viewBottom;
    
    selfH=selfMaxY-tempRect.origin.y;
    
    tempRect.size.height=selfH;
    
    self.frame=tempRect;
}


/**
 底边和选定的view对齐
 注意:设置此项前先设置top
 */
-(void)xb_bottomEqualTo:(UIView *)view
{
    CGRect tempRect=self.frame;
    
    CGFloat selfH;
    CGFloat selfMaxY;
    
    //            if ([self isSubViewOfView:view])
    if (isSubViewOfView_subV_fatherV(self, view))
    {
        selfMaxY=[view xb_height];
    }
    else
    {
        selfMaxY=CGRectGetMaxY(view.frame);
    }
    
    selfH=selfMaxY-tempRect.origin.y;
    
    tempRect.size.height=selfH;
    
    self.frame=tempRect;
}


/**
 底边的位置,高度
 */
-(void)xb_bottom:(CGFloat)viewBottom height:(CGFloat)height
{
    CGRect tempRect=self.frame;
    
    CGFloat selfMaxY=viewBottom;
    
    CGFloat selfY=selfMaxY - height;
    
    tempRect.size.height=height;
    
    tempRect.origin.y=selfY;
    
    self.frame=tempRect;
}


/**
 底边的位置,顶边的位置
 */
//-(void)xb_bottom:(CGFloat)viewBottom top:(CGFloat)viewTop
//{
//    CGRect tempRect=self.frame;
//
//    CGFloat selfMaxY=viewBottom;
//
//    CGFloat selfH=selfMaxY - viewTop;
//
//    tempRect.size.height=selfH;
//
//    tempRect.origin.y=viewTop;
//
//    self.frame=tempRect;
//}


/**
 上下左右
 */
-(void)xb_left:(CGFloat)left right:(CGFloat)right top:(CGFloat)top bottom:(CGFloat)bottom
{
    CGRect tempRect=self.frame;
    
    tempRect.origin.x=left;
    tempRect.origin.y=top;
    
    tempRect.size.width=right-left;
    tempRect.size.height=bottom-top;
    
    self.frame=tempRect;
}
/**
 左上宽高
 */
-(void)xb_left:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height
{
    self.frame=CGRectMake(left, top, width, height);
}


/**
 和某个view同一个中心点
 参数1:参考view
 */
-(void)xb_centerEqualToView:(UIView *)view
{
    //            if ([self isSubViewOfView:view])
    if (isSubViewOfView_subV_fatherV(self, view))
    {
        CGFloat fatherViewWidth=[view xb_width];
        CGFloat fatherViewHeight=[view xb_height];
        
        CGFloat subViewWidth=[self xb_width];
        CGFloat subViewHeight=[self xb_height];
        
        CGFloat subViewX=(fatherViewWidth-subViewWidth)/2;
        CGFloat subViewY=(fatherViewHeight-subViewHeight)/2;
        
        self.frame=CGRectMake(subViewX, subViewY, subViewWidth, subViewHeight);
    }
    else
    {
        self.center=view.center;
    }
    
}


/**
 和某个view同centerX;
 前提:必须是兄弟view或者self是view的子view
 */
-(void)xb_centerXEqualToView:(UIView *)view
{
    //            if ([self isSubViewOfView:view])
    if (isSubViewOfView_subV_fatherV(self, view))
    {
        CGFloat fatherViewWidth=[view xb_width];
        
        CGFloat selfWidth=[self xb_width];
        
        CGFloat selfX=(fatherViewWidth-selfWidth)/2;
        
        CGRect tempRect=self.frame;
        
        tempRect.origin.x=selfX;
        
        self.frame=tempRect;
    }
    else
    {
        CGPoint tempPoint=self.center;
        
        tempPoint.x=view.center.x;
        
        self.center=tempPoint;
    }
}


/**
 和某个view同centerX;
 前提:必须是兄弟view或者self是view的子view
 参数1:参照view
 参数2:倍数
 参数3:位置调整,正右,负左
 */
-(void)xb_centerXEqualToView:(UIView *)view multiplier:(CGFloat)multiplier constant:(CGFloat)constant
{
    //            if ([self isSubViewOfView:view])
    if (isSubViewOfView_subV_fatherV(self, view))
    {
        CGFloat fatherViewWidth=[view xb_width];
        
        CGFloat selfWidth=[self xb_width];
        
        CGFloat tempF=fatherViewWidth/2 * multiplier + constant;
        
        CGFloat selfX=tempF-selfWidth/2;
        
        CGRect tempRect=self.frame;
        
        tempRect.origin.x=selfX;
        
        self.frame=tempRect;
    }
    else
    {
        CGPoint tempPoint=self.center;
        
        tempPoint.x=view.center.x * multiplier + constant;
        
        self.center=tempPoint;
    }
}


/**
 和某个view同centerY;
 前提:必须是兄弟view或者self是view的子view
 */
-(void)xb_centerYEqualToView:(UIView *)view
{
    //            if ([self isSubViewOfView:view])
    if (isSubViewOfView_subV_fatherV(self, view))
    {
        CGFloat fatherViewHeight=[view xb_height];
        
        CGFloat selfHeight=[self xb_height];
        
        CGFloat selfY=(fatherViewHeight-selfHeight)/2;
        
        CGRect tempRect=self.frame;
        
        tempRect.origin.y=selfY;
        
        self.frame=tempRect;
    }
    else
    {
        CGPoint tempPoint=self.center;
        
        tempPoint.y=view.center.y;
        
        self.center=tempPoint;
    }
}

/**
 centerX;
 前提:必须设置了宽度
 */
-(void)xb_centerX:(CGFloat)centerX
{
    CGFloat w=self.bounds.size.width/2;
    CGFloat selfCentenX=self.frame.origin.x+w;
    CGFloat space=centerX-selfCentenX;
    [self xb_left:CGRectGetMinX(self.frame)+space];
}
/**
 centerY;
 前提:必须设置了宽度
 */
-(void)xb_centerY:(CGFloat)centerY
{
    CGFloat h=self.bounds.size.height/2;
    CGFloat selfCentenY=self.frame.origin.y+h;
    CGFloat space=centerY-selfCentenY;
    [self xb_top:CGRectGetMinY(self.frame)+space];
}



/**
 和某个view同centerY;
 前提:必须是兄弟view或者self是view的子view
 参数1:参照view
 参数2:倍数
 参数3:位置调整,正下,负上
 */
-(void)xb_centerYEqualToView:(UIView *)view multiplier:(CGFloat)multiplier constant:(CGFloat)constant
{
    //            if ([self isSubViewOfView:view])
    if (isSubViewOfView_subV_fatherV(self, view))
    {
        CGFloat fatherViewHeight=[view xb_height];
        
        CGFloat selfHeight=[self xb_height];
        
        CGFloat tempF=fatherViewHeight/2 * multiplier + constant;
        
        CGFloat selfY=tempF-selfHeight/2;
        
        CGRect tempRect=self.frame;
        
        tempRect.origin.y=selfY;
        
        self.frame=tempRect;
    }
    else
    {
        CGPoint tempPoint=self.center;
        
        tempPoint.y=view.center.y * multiplier + constant;
        
        self.center=tempPoint;
    }
}


/**
 设置width
 */
-(void)xb_width:(CGFloat)width
{
    CGRect tempRect=self.frame;
    
    tempRect.size.width=width;
    
    self.frame=tempRect;
}

/**
 width上添加的量
 */
-(void)xb_widthAdd:(CGFloat)width
{
    CGRect tempRect=self.frame;
    
    tempRect.size.width+=width;
    
    self.frame=tempRect;
}


/**
 设置width
 参数1:参照view
 参数2:倍数
 参数3:调整量,正加,负减
 */
-(void)xb_widthEqualToView:(UIView *)view multiplier:(CGFloat)multiplier constant:(CGFloat)constant
{
    CGFloat tempWidth=[view xb_width] * multiplier + constant;
    
    CGRect tempFrame=self.frame;
    
    tempFrame.size.width=tempWidth;
    
    self.frame=tempFrame;
}


/**
 设置height
 */
-(void)xb_height:(CGFloat)height
{
    CGRect tempRect=self.frame;
    
    tempRect.size.height=height;
    
    self.frame=tempRect;
}

/**
 height上添加的量
 */
-(void)xb_heightAdd:(CGFloat)height
{
    CGRect tempRect=self.frame;
    
    tempRect.size.height+=height;
    
    self.frame=tempRect;
}



/**
 设置height
 参数1:参照view
 参数2:倍数
 参数3:调整量,正加,负减
 */
-(void)xb_heightEqualToView:(UIView *)view multiplier:(CGFloat)multiplier constant:(CGFloat)constant
{
    CGFloat tempHeight=[view xb_height] * multiplier + constant;
    
    CGRect tempFrame=self.frame;
    
    tempFrame.size.height=tempHeight;
    
    self.frame=tempFrame;
}


/** 高度和宽度相等 */
-(void)xb_heightEqualToWidthMultiplier:(CGFloat)multiplier constant:(CGFloat)constant
{
    CGFloat width=[self xb_width];
    
    [self xb_height:(width * multiplier + constant)];
}


/** 宽度和高度相等 */
-(void)xb_widthEqualToHeightMultiplier:(CGFloat)multiplier constant:(CGFloat)constant
{
    CGFloat height=[self xb_height];
    
    [self xb_width:(height * multiplier + constant)];
}


/**
 设置size
 */
-(void)xb_size:(CGSize)size
{
    CGRect tempRect=self.frame;
    
    tempRect.size=size;
    
    self.frame=tempRect;
}


/**
 设置size和某个view相同
 */
-(void)xb_sizeEqualToView:(UIView *)view
{
    CGRect tempRect=self.frame;
    
    tempRect.size=view.bounds.size;
    
    self.frame=tempRect;
}


/**
 调整frame.origin
 addOriginX:原来x上添加的量
 addOriginY:原来Y上添加的量
 */
-(void)xb_updateOriginAddOriginX:(CGFloat)addOriginX addOriginY:(CGFloat)addOriginY
{
    CGRect tempRect=self.frame;
    
    tempRect.origin.x+=addOriginX;
    
    tempRect.origin.y+=addOriginY;
    
    self.frame=tempRect;
}

/**
 调整frame.size
 addOriginX:原来x上添加的量
 addOriginY:原来Y上添加的量
 */
-(void)xb_updateSizeAddWidth:(CGFloat)addWidth addHeight:(CGFloat)addHeight
{
    CGRect tempRcet=self.frame;
    
    tempRcet.size.width+=addWidth;
    
    tempRcet.size.height+=addHeight;
    
    self.frame=tempRcet;
}


/**
 中心点不动,调整frame.size
 */
-(void)xb_updateSizeKeepCenterAddWidth:(CGFloat)addWidth addHeight:(CGFloat)addHeight
{
    CGRect tempRcet=self.frame;
    
    tempRcet.origin.x-=addWidth/2;
    
    tempRcet.origin.y-=addHeight/2;
    
    tempRcet.size.width+=addWidth;
    
    tempRcet.size.height+=addHeight;
    
    self.frame=tempRcet;
}


/**
 中心点不动,调整frame.size
 参数1:新的size
 */
-(void)xb_updateSizeKeepCenterNewSize:(CGSize)size
{
    CGSize tempSize=CGSizeMake(size.width-self.frame.size.width, size.height-self.frame.size.height);
    
    [self xb_updateSizeKeepCenterAddWidth:tempSize.width addHeight:tempSize.height];
}


@end

//
//  UIButton+CustomFunctions.m
//  XBTest
//
//  Created by XXB on 16/9/16.
//  Copyright © 2016年 XXB. All rights reserved.
//

#import "UIButton+CustomFunctions.h"

@implementation UIButton (CustomFunctions)

/**
 *  图片在上，文字在下布局
 *  参数1：图片在竖直方向上所占的比例
 *  参数2：图片顶部离button顶部的距离
 */
-(void)imageTopAndTitleBottomWithImageHScale:(CGFloat)imageHScale topSpace:(CGFloat)topSpace
{
    [self layoutIfNeeded];
    
    CGFloat selfH=self.bounds.size.height;
    CGFloat selfW=self.bounds.size.width;
    
    UIImage *image=self.imageView.image;
    CGFloat imageH=image.size.height;
    CGFloat imageW=image.size.width;
    CGFloat titleLEdge=-imageW;
    
    CGFloat imageHWScale=imageH/imageW;
    CGFloat titleTopEdge=selfH*imageHScale;
    
    CGFloat imageBottomEdge=selfH*(1-imageHScale);
    CGFloat imageWAfterScale=titleTopEdge/imageHWScale;
    CGFloat imageLeftEdge=(selfW-imageWAfterScale)*0.5;
    
    
    self.titleEdgeInsets=UIEdgeInsetsMake(titleTopEdge+topSpace, titleLEdge, 0, 0);
    if (titleTopEdge >= imageH)
    {
        self.imageEdgeInsets=UIEdgeInsetsMake(topSpace,(selfW-imageW)*0.5, imageBottomEdge-topSpace, (selfW-imageW)*0.5);
    }
    else
    {
        self.imageEdgeInsets=UIEdgeInsetsMake(topSpace, imageLeftEdge, imageBottomEdge-topSpace, imageLeftEdge);
    }
}

/**
 *  图片在上，文字在下布局
 *  参数1：图片在竖直方向上所占的比例
 *  参数2：图片顶部离button顶部的距离
 *  参数3：文字在竖直方向上的偏移，+往下，-往上，用于调整图片和文字的间距
 */
-(void)imageTopAndTitleBottomWithImageHScale:(CGFloat)imageHScale topSpace:(CGFloat)topSpace vOffsetOfText:(CGFloat)vOffsetOfText
{
    [self layoutIfNeeded];
    
    CGFloat selfH=self.bounds.size.height;
    CGFloat selfW=self.bounds.size.width;
    
    UIImage *image=self.imageView.image;
    CGFloat imageH=image.size.height;
    CGFloat imageW=image.size.width;
    CGFloat titleLEdge=-imageW;
    
    CGFloat imageHWScale=imageH/imageW;
    CGFloat titleTopEdge=selfH*imageHScale;
    
    CGFloat imageBottomEdge=selfH*(1-imageHScale);
    CGFloat imageWAfterScale=titleTopEdge/imageHWScale;
    CGFloat imageLeftEdge=(selfW-imageWAfterScale)*0.5;
    
    
    self.titleEdgeInsets=UIEdgeInsetsMake(titleTopEdge+topSpace+vOffsetOfText*2, titleLEdge, 0, 0);
    if (titleTopEdge >= imageH)
    {
        self.imageEdgeInsets=UIEdgeInsetsMake(topSpace,(selfW-imageW)*0.5, imageBottomEdge-topSpace, (selfW-imageW)*0.5);
    }
    else
    {
        self.imageEdgeInsets=UIEdgeInsetsMake(topSpace, imageLeftEdge, imageBottomEdge-topSpace, imageLeftEdge);
    }
}


/**
 *  图片文字同一水平线上布局
 *  参数1：图片在竖直方向上所占的比例
 *  参数2：图片和文字之间的距离
 *  参数3：内容（图片和文字）靠左边、处于中间、靠右
 *  参数4：靠左或者靠右时，内容（图片和文字）离边缘的距离
 */
-(void)imageLeftAndTitleRightWithImageHScale:(CGFloat)imageHScale spaceOfImageAndTitle:(CGFloat)spaceOfImageAndTitle side:(XBLCRSide)side sideSpace:(CGFloat)sideSpace
{
    [self layoutIfNeeded];
    
    CGFloat selfH=self.bounds.size.height;
    CGFloat selfW=self.bounds.size.width;
    
    UIImage *image=self.imageView.image;
    CGFloat imageW=image.size.width;
    CGFloat imageH=image.size.height;
    CGFloat imageHWScale=imageH/imageW;
    CGFloat imageHAfterScale=selfH*imageHScale;
    CGFloat imageWAfertScale=imageHAfterScale/imageHWScale;
    
    NSString *title=self.titleLabel.text;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = self.titleLabel.font;
    [label sizeToFit];
    CGFloat titleW=label.frame.size.width;
    CGFloat titleLeftAuto;
    
    BOOL selfWLonger=selfW>=(imageW+titleW);
    
    if (selfWLonger)
    {
        titleLeftAuto=(selfW-imageW-titleW)/2+imageW;
    }
    else
    {
        titleLeftAuto=imageW;
    }
    
    
    CGFloat imageLeftEdge;
    if (side==XBLCRSideCenter)
    {
        imageLeftEdge=(selfW-(imageWAfertScale+spaceOfImageAndTitle+titleW))/2;
    }
    else if(side==XBLCRSideLeft)
    {
        imageLeftEdge=sideSpace;
    }
    else
    {
        imageLeftEdge=(selfW-(imageWAfertScale+spaceOfImageAndTitle+titleW))-sideSpace;
    }
    
    CGFloat imageTopEdge=(selfH-imageHAfterScale)/2;
    CGFloat imageRightEdge=selfW-imageLeftEdge-imageWAfertScale;
    CGFloat imageRight=selfW-imageRightEdge;
    CGFloat titleLeft=imageRight+spaceOfImageAndTitle;
    CGFloat titleLeftEdge=titleLeft-titleLeftAuto;
    
    self.imageEdgeInsets=UIEdgeInsetsMake(imageTopEdge, imageLeftEdge, imageTopEdge, imageRightEdge);
    
    if (side==XBLCRSideLeft)
    {
        if (selfWLonger)
        {
            self.titleEdgeInsets=UIEdgeInsetsMake(0, titleLeftEdge*2, 0, 0);
        }
        else
        {
            CGFloat adjustEdge=imageRightEdge-titleW-spaceOfImageAndTitle;
            if(adjustEdge<0)
            {
                adjustEdge=-adjustEdge;
            }
            self.titleEdgeInsets=UIEdgeInsetsMake(0, titleLeftEdge-adjustEdge, 0, 0);
        }
    }
    else if (side==XBLCRSideCenter)
    {
        if (selfWLonger)
        {
            self.titleEdgeInsets=UIEdgeInsetsMake(0, titleLeftEdge*2, 0, 0);
        }
        else
        {
            CGFloat adjustEdge=imageRightEdge-titleW-spaceOfImageAndTitle;
            
            if(adjustEdge<0)
            {
                adjustEdge=-adjustEdge;
            }
            
            self.titleEdgeInsets=UIEdgeInsetsMake(0, titleLeftEdge-adjustEdge, 0, 0);
        }
    }
    else
    {
        if (selfWLonger)
        {
            self.titleEdgeInsets=UIEdgeInsetsMake(0, titleLeftEdge*2, 0, 0);
        }
        else
        {
            self.titleEdgeInsets=UIEdgeInsetsMake(0, titleLeftEdge-sideSpace, 0, 0);
        }
    }
}

- (void)verticalImageAndTitle:(CGFloat)spacing
{
//    self.titleLabel.backgroundColor = [UIColor greenColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}
@end

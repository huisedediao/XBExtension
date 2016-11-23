

#import "XBPublicFunctions.h"

@interface XBPublicFunctions ()

@end

@implementation XBPublicFunctions

#pragma mark - size相关
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

/**
 根据输入的字符串,宽度和字体,算出适合显示的高度的size
 */
+(CGSize)getSizeWith:(NSString *)string width:(CGFloat)width font:(UIFont *)font
{
    CGSize size=[string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :font} context:NULL].size;
    return size;
}

/**
 根据输入的字符串,宽度和字体,得到适合显示string的label
 */
+(UILabel *)autoSizeLabel:(CGPoint)origin text:(NSString *)text width:(CGFloat)width font:(UIFont *)font
{
    
    CGSize size=[XBPublicFunctions getSizeWith:text width:width font:font];
    
    UILabel *label=[[UILabel alloc] init];
    label.frame=CGRectMake(origin.x,origin.y,width,size.height);
    label.font=font;
    label.text=text;
    label.numberOfLines=0;
    
    return label;
}


#pragma mark - 路径相关
/**
 根据文件名获取完整的沙盒路径(Documents文件夹下)
 */
+(NSString *)pathForSandboxDocumentsWith:(NSString *)fileName
{
    NSString *sandboxPath=[NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),fileName];
    return sandboxPath;
}

/**
 判断路径所指是否有文件存在
 */
+(BOOL)isExistFileAtPath:(NSString *_Nonnull)path
{
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

#pragma mark - UIApplication相关
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


#pragma mark - json相关
/**
 解析json
 */
+(id)JSONObjectWithData:(NSData *)data
{
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}


#pragma mark - 图片相关
/**
 *  从url加载图片,同步加载,界面会卡
 */
+ (UIImage *) syncLoadImageFromURLString: (NSString *) urlstring
{
    // This call is synchronous and blocking
    return [UIImage imageWithData:[NSData
                                   dataWithContentsOfURL:[NSURL URLWithString:urlstring]]];
}

/**
 *  从url加载图片,异步加载,界面不会卡
 */
+ (void) asyncLoadImageFromURLString: (NSString *) urlstring successBlock:(asyncDownloadImgSuccessBlock)successBlock failureBlock:(asyncDownloadImgFailureBlock)failureBlock
{
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:urlstring] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if (error)
        {
            XBFlog(@"error is %@",error);
            if (failureBlock)
            {
                failureBlock(error);
            }
        }
        else
        {
            if (successBlock)
            {
                successBlock(image);
            }
        }
    }];
    
}


/**
 *  获取图片二进制数据(必须是用SDWebImage存储的图片)
 *  参数:图片url
 */
+(NSData *)getSDWebImageDataWithImageURL:(NSString *)imageURL
{
    NSData *imageData = nil;
    BOOL isExit = [[SDWebImageManager sharedManager] diskImageExistsForURL:[NSURL URLWithString:imageURL]];
    if (isExit)
    {
        NSString *cacheImageKey = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:imageURL]];
        if (cacheImageKey.length)
        {
            NSString *cacheImagePath = [[SDImageCache sharedImageCache] defaultCachePathForKey:cacheImageKey];
            if (cacheImagePath.length)
            {
                imageData = [NSData dataWithContentsOfFile:cacheImagePath];
            }
        }
    }
    if (!imageData)
    {
        imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
    }
    return imageData;
}

/**
 *  获取图片的路径(必须是用SDWebImage存储的图片)
 *  参数:图片url
 */
+(NSString *)getSDWebImagePathWithImageURL:(NSString *)imageURL
{
    BOOL isExit = [[SDWebImageManager sharedManager] diskImageExistsForURL:[NSURL URLWithString:imageURL]];
    if (isExit)
    {
        NSString *cacheImageKey = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:imageURL]];
        if (cacheImageKey.length)
        {
            NSString *cacheImagePath = [[SDImageCache sharedImageCache] defaultCachePathForKey:cacheImageKey];
            if (cacheImagePath.length)
            {
                return cacheImagePath;
            }
        }
    }
    
    return nil;
}


#pragma mark - 时间相关
/**
 *  获取当前时间戳
 */
//+(NSTimeInterval)getCurrentTimeInterval
//{
//    //获取当前系统时间戳
//    NSDate* data = [NSDate dateWithTimeIntervalSinceNow:0];
//    NSTimeInterval a=[data timeIntervalSince1970];  //  *1000 是精确到毫秒，不乘就是精确到秒
//    return a;
//}

/**
 *  时间戳转换成时间
 *  参数1:时间戳
 *  参数2:日期格式
 */
+(NSString *)dateStrFromTimeStampStr:(NSString *)timeStampStr dateFormatterStr:(NSString *)dateFormatterStr
{
    //    NSString *str=@"1368082020";//时间戳
    NSString *str=timeStampStr;
    //    NSTimeInterval time=[str doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
    NSTimeInterval time=[str doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    if (dateFormatterStr==nil)
    {
        dateFormatterStr=@"yyyy-MM-dd HH:mm:ss";
    }
    [dateFormatter setDateFormat:dateFormatterStr];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    
    return currentDateStr;
}

/**
 * NSDate转换成字符串
 * 参数1:NSDate
 * 参数2:参数2:日期格式
 */
+ (NSString *)stringFromDate:(NSDate *)date dateFormatterStr:(NSString *)dateFormatterStr
{
    //转换成北京时间
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSInteger interval = [zone secondsFromGMTForDate: date];
    //    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    
    //    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    //    @"yyyy-MM-dd HH:mm:ss zzz";
    
    if (dateFormatterStr==nil)
    {
        dateFormatterStr=@"yyyy-MM-dd HH:mm:ss";
    }
    
    [dateFormatter setDateFormat:dateFormatterStr];
    
    
    return [dateFormatter stringFromDate:date];
    
    
}


/**
 * NSString转换成NSDate
 * 参数1:NSString
 * 参数2:参数2:日期格式
 */
+ (NSDate *_Nullable)dateFromString:(NSString *_Nullable)dateStr dateFormatterStr:(NSString *_Nullable )dateFormatterStr
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    
    //    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    //    @"yyyy-MM-dd HH:mm:ss zzz";
    
    if (dateFormatterStr==nil)
    {
        dateFormatterStr=@"yyyy-MM-dd HH:mm:ss";
    }
    
    [dateFormatter setDateFormat:dateFormatterStr];
    
    
    return [dateFormatter dateFromString:dateStr];
}


#pragma mark - keyValue相关
/**
 * 获取对象的所有属性
 * 参数:[xxx class]
 * 返回值:都为字符串的数组
 */
+ (NSArray *)getAllProperties:(Class)className;
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList(className, &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
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

#pragma mark - 数组相关
/**
 *  将数组重复的对象去除，只保留一个(注意是相同的对象,即拥有相同内存地址)
 */
+ (NSArray *)arrayWithMemberIsOnly:(NSArray *)array
{
    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<array.count; i++)
    {
        if ([categoryArray containsObject:array[i]]==NO)
        {
            [categoryArray addObject:array[i]];
        }
    }
    return categoryArray;
}

/**
 *  将数组中,将某个属性的值重复的对象去除，只保留一个,属性对应的值只能是字符串
 *  参数2:数组里面对象的属性名
 */
+ (NSArray *)arrayWithMemberIsOnly:(NSArray *)array byKeyPath:(NSString *)keyPath
{
    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<array.count; i++)
    {
        id obj=array[i];
        BOOL hasContained=NO;
        for (id subObj in categoryArray)
        {
            if ([[obj valueForKey:keyPath] isEqualToString:[subObj valueForKey:keyPath]])
            {
                hasContained=YES;
                break;
            }
        }
        if (hasContained==NO)
        {
            [categoryArray addObject:obj];
        }
    }
    return categoryArray;
}

/**
 *  将数组中,某个重复的字符串去除
 */
+ (NSArray *)arrayWithStringMemberIsOnly:(NSArray *)array
{
    NSMutableArray *categoryArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<array.count; i++)
    {
        id obj=array[i];
        BOOL hasContained=NO;
        for (id subObj in categoryArray)
        {
            if ([obj isEqualToString:subObj])
            {
                hasContained=YES;
                break;
            }
        }
        if (hasContained==NO)
        {
            [categoryArray addObject:obj];
        }
    }
    return categoryArray;
}

/**
 * 排序
 * 参数1:属性名
 * 是否降序(从大到小),yes:是
 */
+ (NSArray *)sortedArrFromSourceArr:(NSArray *)sourceArr byKeyPath:(NSString *)keyPath desc:(BOOL)desc
{
    NSArray *returnArr=[sourceArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSComparisonResult result;
        if ([[obj1 valueForKey:keyPath] floatValue]<[[obj2 valueForKey:keyPath] floatValue])
        {
            result=desc?1:0;
        }
        else
        {
            result=desc?0:1;
        }
        return result;
    }];
    return returnArr;
}

#pragma mark - 键盘相关
/** 键盘不遮挡所需view */
+(void)displayView:(UIView *)displayView  adaptKeyBoardForView:(UIView *)view notification:(NSNotification *)noti
{
    [displayView layoutIfNeeded];
    
    //获取取键盘展开后的rect
    CGRect rect = [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    //获取键盘的高度
    CGFloat keyBoardHeight = rect.size.height;
    
    
    //    CGRect beginKeyboardRect = [[noti.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    //    CGRect endKeyboardRect = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //
    //    CGFloat keyBoardHeight=beginKeyboardRect.origin.y-endKeyboardRect.origin.y;
    
    if (keyBoardHeight<215)
    {
        keyBoardHeight=250;
    }
    
    CGRect viewRect=[view convertRect:view.bounds toView:displayView];
    CGFloat maxYOfView=CGRectGetMaxY(viewRect);
    CGFloat displayViewH=displayView.bounds.size.height;
    
    CGFloat gap= (displayViewH-keyBoardHeight)-maxYOfView;
    
    if (gap<0)//被遮挡了
    {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect tempRect=displayView.frame;
            tempRect.origin.y+=gap;
            displayView.frame=tempRect;
        }];
    }
}


/**
 *  多线程
 *
 *  @param subBlock  子线程执行的任务
 *  @param mainBlock 主线程执行的任务,子线程任务执行完成后执行
 */
+(void)subThreadTaskBlock:(SubThreadTaskBlock _Nonnull)subBlock mainThreadTaskBlock:(MainThreadTaskBlock _Nonnull)mainBlock
{
    //创建并行队列
    dispatch_queue_t queue=dispatch_queue_create("GCD", DISPATCH_QUEUE_CONCURRENT);
    //往queue队列中添加任务,异步执行
    dispatch_async(queue, ^{
        if(subBlock)
        {
            subBlock();
        }
        //回到主线程刷新UI:往主队列(任务由主线程执行的队列)添加任务,异步执行
        dispatch_async(dispatch_get_main_queue(), ^{
            if (mainBlock)
            {
                mainBlock();
            }
        });
    });
}


@end

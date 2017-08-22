

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "XBDefine.h"
#import "SDWebImageManager.h"


//多线程之子线程任务
typedef void (^SubThreadTaskBlock) (void);
//多线程之主线程任务
typedef void (^MainThreadTaskBlock) (void);

//异步下载图片完成后的block
typedef void (^asyncDownloadImgSuccessBlock) (UIImage *_Nullable image);
//异步下载失败后的block
typedef void (^asyncDownloadImgFailureBlock) (NSError *_Nullable error);


@interface XBPublicFunctions : NSObject


#pragma mark - ----类方法----

#pragma mark - size相关
/**
 根据传入的width和 宽高比 获取size
 */
+(CGSize)getSizeWithWidth:(CGFloat)width proportion:(CGFloat)proportion;

/**
 根据传入的文字和字体获取宽度
 */
+ (CGFloat)getWidthWithTitle:(NSString *_Nullable )title font:(UIFont *_Nullable )font;

/**
 根据输入的字符串,宽度和字体,算出适合显示的高度的size
 */
+(CGSize)getSizeWith:(NSString *_Nullable )string width:(CGFloat)width font:(UIFont *_Nullable )font;

/**
 根据输入的字符串,宽度和字体,得到适合显示string的label
 */
+(UILabel *_Nullable )autoSizeLabel:(CGPoint)origin text:(NSString *_Nullable )text width:(CGFloat)width font:(UIFont *_Nullable )font;


#pragma mark - 路径相关
/**
 根据文件名获取完整的沙盒路径(Documents文件夹下)
 */
+(NSString *_Nullable )pathForSandboxDocumentsWith:(NSString *_Nullable )fileName;
/**
 判断路径所指是否有文件存在
 */
+(BOOL)isExistFileAtPath:(NSString *_Nonnull)path;


#pragma mark - UIApplication相关
/**
 开启状态栏菊花
 */
+(void)startNetworkActivityIndicator;

/**
 关闭状态栏菊花
 */
+(void)stopNetworkActivityIndicator;


#pragma mark - json相关
/**
 解析json
 */
+(id _Nullable )JSONObjectWithData:(NSData *_Nullable )data;


#pragma mark - 图片相关
/**
 *  从url加载图片,同步加载,界面会卡
 */
+ (UIImage *_Nullable ) syncLoadImageFromURLString: (NSString *_Nullable ) urlstring;


/**
 *  从url加载图片,异步加载,界面不会卡
 */
+ (void) asyncLoadImageFromURLString: (NSString *_Nullable ) urlstring successBlock:(asyncDownloadImgSuccessBlock _Nullable )successBlock failureBlock:(asyncDownloadImgFailureBlock _Nullable )failureBlock;

/**
 *  获取图片二进制数据(必须是用SDWebImage存储的图片)
 *  参数:图片url
 */
+(NSData *_Nullable )getSDWebImageDataWithImageURL:(NSString *_Nullable )imageURL;

/**
 *  获取图片的路径(必须是用SDWebImage存储的图片)
 *  参数:图片url
 */
+(NSString *_Nullable )getSDWebImagePathWithImageURL:(NSString *_Nullable )imageURL;


#pragma mark - 时间相关
/**
 *  获取当前时间戳
 */
//+(NSTimeInterval)getCurrentTimeInterval;

/**
 *  时间戳转换成时间字符串
 *  参数1:时间戳
 *  参数2:日期格式
 */
+(NSString *_Nullable )dateStrFromTimeStampStr:(NSString *_Nullable )timeStampStr dateFormatterStr:(NSString *_Nullable )dateFormatterStr;


/**
 *  时间戳转换成时间字符串
 *  参数1:时间戳
 *  参数2:时区
 */
+ (NSString *)dateStrFromTimeStampStr:(NSString *)timeStampStr timeZone:(NSString *)strTimeZone;

/**
 * NSDate转换成字符串
 * 参数1:NSDate
 * 参数2:参数2:日期格式
 */
+ (NSString *_Nullable )stringFromDate:(NSDate *_Nullable )date dateFormatterStr:(NSString *_Nullable )dateFormatterStr;


/**
 * NSString转换成NSDate
 * 参数1:NSString
 * 参数2:参数2:日期格式
 */
+ (NSDate *_Nullable)dateFromString:(NSString *_Nullable)dateStr dateFormatterStr:(NSString *_Nullable )dateFormatterStr;



#pragma mark - keyValue相关
/**
 * 获取对象的所有属性
 * 参数:[xxx class]
 * 返回值:都为字符串的数组
 */
+ (NSArray *_Nullable )getAllProperties:(Class _Nullable )className;






#pragma mark - navigationBarButtonItem
+(UIBarButtonItem *_Nullable )navigationBarButtonItemWithText:(NSString *_Nullable )text textColor:(UIColor *_Nullable )textColor textFont:(UIFont *_Nullable )textFont target:(id _Nullable )target action:(SEL _Nullable )action forControlEvents:(UIControlEvents)controlEvents tag:(NSInteger)tag;


+(NSArray *_Nullable )navigationBarButtonItemAndButtonWithText:(NSString *_Nullable )text textColor:(UIColor *_Nullable )textColor textFont:(UIFont *_Nullable )textFont target:(id _Nullable )target action:(SEL _Nullable )action forControlEvents:(UIControlEvents)controlEvents tag:(NSInteger)tag;


#pragma mark - 数组相关
/**
 *  将数组重复的对象去除，只保留一个(注意是相同的对象,即拥有相同内存地址)
 */
+ (NSArray *_Nullable )arrayWithMemberIsOnly:(NSArray *_Nullable )array;

/**
 *  将数组中,将某个属性的值重复的对象去除，只保留一个,属性对应的值只能是字符串
 *  参数2:数组里面对象的属性名
 */
+ (NSArray *_Nullable )arrayWithMemberIsOnly:(NSArray *_Nullable )array byKeyPath:(NSString *_Nullable )keyPath;

/**
 *  将数组中,某个重复的字符串去除
 */
+ (NSArray *_Nullable )arrayWithStringMemberIsOnly:(NSArray *_Nullable )array;

/**
 * 排序
 * 参数1:属性名
 * 是否降序(从大到小),yes:是
 */
+ (NSArray *_Nullable )sortedArrFromSourceArr:(NSArray *_Nullable )sourceArr byKeyPath:(NSString *_Nullable )keyPath desc:(BOOL)desc;


#pragma mark - 键盘相关
/**
 键盘不遮挡所需view
 displayView只能是self.view或者window
 */
+ (void)displayView:(UIView *_Nullable )displayView  adaptKeyBoardForView:(UIView *_Nullable )view notification:(NSNotification *_Nullable )noti;


#pragma mark - 多线程相关
/**
 *  多线程
 *
 *  @param subBlock  子线程执行的任务
 *  @param mainBlock 主线程执行的任务,子线程任务执行完成后执行
 */
+(void)subThreadTaskBlock:(SubThreadTaskBlock _Nonnull)subBlock mainThreadTaskBlock:(MainThreadTaskBlock _Nonnull)mainBlock;
@end

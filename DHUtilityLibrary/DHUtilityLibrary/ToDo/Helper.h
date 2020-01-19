//
//  Helper.h
//  SYHotLine
//
//  Created by dch on 2018/7/2.
//  Copyright © 2018年 dch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helper : NSObject

#pragma mark - save object
//+ (void)saveObjectWith:(NSString *)obj Key:(NSString *)key;
//+ (void)saveObject:(id)obj Key:(NSString *)key;
////存储自定义类型数据
//+ (void)saveArchiveObject:(id)obj Key:(NSString *)key;
//+ (id)queryObjectWithKey:(NSString *)key;
//+ (id)queryUnArchiveObjectWithKey:(NSString *)key;
//+ (void)removeObjectWithKey:(NSString *)key;
//
//#pragma mark - label size
//+ (CGSize)sizeLabelWidth:(CGFloat)width
//          attributedText:(NSAttributedString *)attributted;
//+ (CGFloat)calculateWidth:(NSString *)str fontsize:(NSInteger)fontsize labelH:(CGFloat)height;
//+ (CGFloat)calculateHeight:(NSString *)str fontsize:(NSInteger)fontsize labelW:(CGFloat)width;
////+ (CGFloat)calculateHeight:(NSString *)str fontsize:(NSInteger)fontsize;
//+ (CGFloat)textHeight:(NSString *)s font:(UIFont*)font textWidth:(CGFloat)width;
//+ (CGFloat)textWidth:(NSString *)s font:(UIFont*)font textHeight:(CGFloat)height;
//+ (CGSize)getStrSize:(NSString *)str width:(CGFloat)maxW fontsize:(CGFloat)fontsize;
//+ (CGSize)getStrSize:(NSString *)str width:(CGFloat)maxW;
//
//#pragma mark - date convert
////转换时间戳成年月日十分
//+ (NSString *)CertaintimeWithTimeIntervalString:(NSString *)timeString;
//#pragma mark - 根据时间格式和时间戳转日期
//+ (NSString *)converttimeWithTimeIntervalString:(NSString *)timeString formatterStr:(NSString *)formatterStr;
//+ (NSString *)stringFromDate:(NSDate *)date;
//+ (NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate;
//+ (NSString *)getUTCFormateLocalDate:(NSString *)localDate;
//+ (NSString *)getUTCSecondFormateLocalDate:(NSString *)localDate;
//
//+ (UIViewController *)getCurControllerWithView:(UIView *)view;
////获取当前所在的控制器
//+ (UIViewController *)getCurrentVCInWindow;
//+ (NSString *)formatTimeWithString:(NSString *)timeStr;
////获取当前时间的时间戳
//+ (NSString *)getNowTimestamp;
////获取当前日期
//+ (NSDate *)getCurrentDate;
////根据日期字符串获取日期
//+ (NSDate *)getDateWithDateStr:(NSString *)datestr;
////获取发生的时间
//+ (NSString *)getTime:(NSString *)datestr;
////根据时间戳 获取  时分秒
//+ (NSString *)getHourMuniteSecond:(NSString *)timestamp;
////根据时间戳获取时间差
//+ (NSString *)getTimeWithTimeStamp:(NSString *)timestamp;
//#pragma mark - 获取到期时间与当前时间的时间差
//+ (int)countDownDays:(NSString *)dateStr;
//
////判断手机号
//+ (BOOL)validatePhoneWithString:(NSString *)phoneNumber;
////判断字符串是否全是数字
//+ (BOOL) deptNumInputShouldNumber:(NSString *)str;
////判断字符串是否为NIL
//+ (BOOL)validateNullString:(NSString *)str;
////判断字符串中是否只包含数字和字母
//+ (BOOL)validateStrContainAlphaNum:(NSString *)tempStr;
//
//+ (NSString*)deviceString;
//
////手机号安全操作
//+ (NSString *)safePhone:(NSString *)phonenum;
//
//+ (UIAlertController *)createAlertCWithTitle:(NSString *)title message:(NSString *)msg alertType:(UIAlertControllerStyle)alertType actionTitleArr:(NSArray *)actionTitleArr handler:(void (^)(NSInteger actionIndex))handler;
//
////获取指定范围内的随机数
//+ (int)getRandomNum:(int)from to:(int)to;
////本地视频时长，大小
//+ (NSDictionary *)getLocalVideoSizeAndTimeWithSourcePath:(NSString *)path;
//
////压缩图片
//+ (UIImage *)scaleImg:(UIImage *)oraginalImg toScale:(CGFloat)scaleSize;
//
////将其他格式文件转成mp3格式
//+ (NSString *)getMP3FileWithOrinalFile:(NSString *)originalFilePath MP3FilePath:(NSString *)mp3Path;
////判断是否存在该文件
//+ (BOOL)isFileExistAtPath:(NSString*)fileFullPath;
////创建要上传文件的路径
//+ (NSString *)getImagePath:(UIImage *)image filename:(NSString *)filename;
//
//+ (void)setcornerRadiusWithView:(UIView *)view radius:(CGFloat)radius;
//+ (void)setBorderWithwidth:(CGFloat)width color:(UIColor *)color view:(UIView *)view;
//+ (void)setborderWithwidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)radius view:(UIView *)view;
//
//+ (void)showError:(id)err;
//
////数组、字典转json字符串
//+ (NSString *)dictToJsonStr:(NSDictionary *)dict;
//+ (NSString *)arryToJsonStr:(NSArray *)array;
////json字符串转数组、字典
//+ (NSDictionary *)jsonToDict:(NSString *)jsonStr;
//+ (NSArray *)jsonToArr:(NSString *)jsonStr;
//
///**
// 把普通的url转换为拼接了baseUrl的url
// 
// @param url 普通的url
// @return 拼接baseurl之后的地址
// */
//+ (NSString *)converUrlToFullUrl:(NSString *)url;
// /*! 检查地址中是否有中文 */
//+ (NSString *)strUTF8Encoding:(NSString *)str;
//
//#pragma mark - 获取文件路径
//+ (NSString*)GetPathByFileName:(NSString *)_fileName ofType:(NSString *)_type;
////获取文件存储文件夹的位置
//+ (NSString *)saveFileDirectPath:(NSString *)directName;
//+ (void)removeFilesWithType:(NSString *)type dirPath:(NSString *)dirPath;
//+ (void)removeFilesWithType:(NSString *)type dirPath:(NSString *)dirPath finish:(void(^)(void))finish;
//+ (void)saveImgToLocalAtPath:(NSString *)filePath img:(UIImage *)img;
////删除单个文件
//+ (void)removesingleFilesWithFilePath:(NSString *)filePath;
//#pragma mark - 将请求的URL文件存在本地
//+ (NSString *)saveUrlFileToLocal:(NSString *)filename;
////音频文件长度
//+ (CGFloat)audioSoundDuration:(NSURL *)fileUrl;
////获取url请求过来的图片image
//+ (UIImage *)getUrlImage:(NSString  *)imgUrlstr;
//
//+ (NSString *)getLocalcacheSize;
//+ (BOOL)clearCache:(void(^)(void))finish;
//+ (CGFloat)getVolume:(float)decibels;
//
//+ (UILabel *)createLabelWithText: (NSString *)text textColor:(UIColor *)textColor labelFont:(UIFont *)font;
//
////版本比较  更新APP
//+ (BOOL)isUpdateWithCompareVersion:(NSString *)newVersion;
//

@end

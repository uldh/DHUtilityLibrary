//
//  Helper.m
//  SYHotLine
//
//  Created by dch on 2018/7/2.
//  Copyright © 2018年 dch. All rights reserved.
//

#import "Helper.h"
//#import <sys/utsname.h>
//#import <AVFoundation/AVFoundation.h>
//#import "lame.h"
//#import "AudioModel.h"
//
//#define VIDEO_FOLDER @"videoFolder"
//
@implementation Helper
//
//#pragma mark - save object
//+ (void)saveObjectWith:(NSString *)obj Key:(NSString *)key
//{
//    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//
//+ (void)saveObject:(id)obj Key:(NSString *)key
//{
//    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//
//+ (void)saveArchiveObject:(id)obj Key:(NSString *)key
//{
//    if (obj==nil) {
//        return;
//    }
//    id data = [NSKeyedArchiver archivedDataWithRootObject:obj];
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//
//+ (id)queryObjectWithKey:(NSString *)key
//{
//    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    return obj;
//}
//
//+ (id)queryUnArchiveObjectWithKey:(NSString *)key
//{
//    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
//    if (obj==nil) {
//        return nil;
//    }
//    id resource1 = [NSKeyedUnarchiver unarchiveObjectWithData:obj];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    return resource1;
//}
//
//+ (void)removeObjectWithKey:(NSString *)key
//{
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//}
//
//#pragma mark - label size
//+ (CGSize)sizeLabelWidth:(CGFloat)width
//          attributedText:(NSAttributedString *)attributted
//{
//    if(width<=0){
//        return CGSizeZero;
//    }
//    
//    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 1000)];
//    lab.attributedText = attributted;
//    lab.numberOfLines = 0;
//    
//    CGSize labSize = [lab sizeThatFits:lab.bounds.size];
//    return labSize;
//}
//
//+ (CGFloat)calculateWidth:(NSString *)str fontsize:(NSInteger)fontsize labelH:(CGFloat)height
//{
//    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]};
//    CGRect rect = [str boundingRectWithSize:CGSizeMake(0, height) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dict context:nil];
//    return rect.size.width;
//}
//
//+ (CGFloat)calculateHeight:(NSString *)str fontsize:(NSInteger)fontsize labelW:(CGFloat)width
//{
//    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]};
//    CGRect rect = [str boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dict context:nil];
//    return rect.size.height;
//}
//
//#pragma mark - 根据文字计算高度
////uitextview
//+ (CGFloat)textHeight:(NSString *)s font:(UIFont*)font textWidth:(CGFloat)width{
//    if (!s || s.length <= 0 || !font) {
//        return 0;
//    }
//    
//    CGSize constraint = CGSizeMake(width, CGFLOAT_MAX);
//    CGSize size = CGSizeZero;
//    NSDictionary *attribute = @{NSFontAttributeName:font};
//    size = [s boundingRectWithSize:constraint options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
//    
//    float fHeight     = size.height;
//    return ceil(fHeight);
//}
//
//+ (CGFloat)textWidth:(NSString *)s font:(UIFont*)font textHeight:(CGFloat)height{
//    if (!s || s.length <= 0 || !font) {
//        return 0;
//    }
//    CGSize constraint = CGSizeMake(CGFLOAT_MAX, height);
//    CGSize size = CGSizeZero;
//    NSDictionary *attribute = @{NSFontAttributeName:font};
//    size = [s boundingRectWithSize:constraint options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
//    float fwidth = size.width;
//    return ceil(fwidth);
//}
//
//+ (CGSize)getStrSize:(NSString *)str width:(CGFloat)maxW fontsize:(CGFloat)fontsize
//{
////     CGSize size = [str boundingRectWithSize:CGSizeMake(maxW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]} context:nil].size;
//     CGSize size = [str boundingRectWithSize:CGSizeMake(maxW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
//    return size;
//}
//
//+ (CGSize)getStrSize:(NSString *)str width:(CGFloat)maxW
//{
//    CGSize size = [str boundingRectWithSize:CGSizeMake(maxW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
//    return size;
//}
//
//#pragma mark - date convert
//+ (NSString *)stringFromDate:(NSDate *)date
//{
//    //用于格式化NSDate对象
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //设置格式：zzz表示时区
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    //NSDate转NSString
//    NSString *currentDateString = [dateFormatter stringFromDate:date];
//    //输出currentDateString
//    NSLog(@"%@",currentDateString);
//    return currentDateString;
//}
//
//#pragma mark - 时间戳转日期
//+ (NSString *)CertaintimeWithTimeIntervalString:(NSString *)timeString{
//    
//    // 格式化时间
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//    formatter.timeZone = [NSTimeZone localTimeZone];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    
//    // 毫秒值转化为秒
//    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
//    NSString* dateString = [formatter stringFromDate:date];
//    return dateString;
//}
//#pragma mark - 根据时间格式和时间戳转日期
//+ (NSString *)converttimeWithTimeIntervalString:(NSString *)timeString formatterStr:(NSString *)formatterStr
//{
//    // 格式化时间
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//    formatter.timeZone = [NSTimeZone localTimeZone];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateFormat:formatterStr];
//    
//    // 毫秒值转化为秒
//    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
//    NSString* dateString = [formatter stringFromDate:date];
//    return dateString;
//}
//
//+ (NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //输入格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
//    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
//    [dateFormatter setTimeZone:localTimeZone];
//    NSDate *dateFormatted = [dateFormatter dateFromString:utcDate];
//    //输出格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
//    return dateString;
//}
//
//+ (NSString *)getUTCFormateLocalDate:(NSString *)localDate {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //输入格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
//    NSDate *dateFormatted = [dateFormatter dateFromString:localDate];
//    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
//    [dateFormatter setTimeZone:timeZone];
//    //输出格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
//    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
//    return dateString;
//}
//
//+ (NSString *)getUTCSecondFormateLocalDate:(NSString *)localDate {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //输入格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
//    //    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    NSDate *dateFormatted = [dateFormatter dateFromString:localDate];
//    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
//    [dateFormatter setTimeZone:timeZone];
//    //输出格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
//    return dateString;
//}
//
//+ (NSString *)formatTimeWithString:(NSString *)timeStr
//{
//    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//    fmt.dateFormat = @"HH:mm:ss";
//    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@""];
//    NSDate *formatdate = [fmt dateFromString:timeStr];
//    NSString *datestr = [fmt stringFromDate:formatdate];
//    return datestr;
//}
//
//+ (NSString *)getNowTimestamp
//{
//    NSDate *nowDate = [NSDate date];
//    double timestamp = (double)([nowDate timeIntervalSince1970]+8*3600)*1000;
//    long nowTimestamp = [[NSNumber numberWithDouble:timestamp] longValue];
//    NSString *timestampStr = [NSString stringWithFormat:@"%ld",nowTimestamp];
//    return timestampStr;
//}
//
//+ (NSDate *)getCurrentDate
//{
//    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
//    [dateFomatter setDateFormat:@"yyyy-MM-dd"];
//    [dateFomatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
//    NSDate *now = [NSDate date];
//    NSString *dateStr = [dateFomatter stringFromDate:[NSDate date]];
//    NSDate *date = [dateFomatter dateFromString:dateStr];
//    return date;
//}
//
//+ (NSDate *)getDateWithDateStr:(NSString *)datestr
//{
//    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSDate *date = [dateFormat dateFromString:datestr];
//    
//    NSDateFormatter *dateFormt = [[NSDateFormatter alloc] init];
//    [dateFormt setDateFormat:@"yyyy-MM-dd"];
//    [dateFormt setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
//    NSString *time = [dateFormt stringFromDate:date];
//    NSDate *signdate = [dateFormt dateFromString:time];
//    
//    return signdate;
//}
//
//+ (NSString *)getTime:(NSString *)datestr
//{
//    // 实例化一个NSDateFommater对象
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *updateDate = [dateFormatter dateFromString:datestr];
//    //    [dateFormatter setDateFormat:@""];
//    
////    NSString *lateDateStr = [dateFormatter stringFromDate:updateDate];
//    //    NSDate *d = [dateFormatter dateFromString:lateDateStr];
//    //日期转换成时间戳
//    NSTimeInterval dateTime = [updateDate timeIntervalSince1970]*1;
//    NSString *timeStr = [self getTimeWithTimeStamp:[NSString stringWithFormat:@"%f",dateTime]];
//    return timeStr;
//}
//
//+ (NSString *)getTimeStamp:(NSString *)datestr dateFormat:(NSString *)dateFormat
//{
//    // 实例化一个NSDateFommater对象
//    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
//    formatter.timeZone = [NSTimeZone localTimeZone];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateFormat:dateFormat];
//    
//    NSDate *updateDate = [formatter dateFromString:datestr];
//    
//    NSDateFormatter * newFomatter = [[NSDateFormatter alloc] init];
//    [newFomatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSString *newDateStr = [newFomatter stringFromDate:updateDate];
//    NSDate *newDate = [newFomatter dateFromString:newDateStr];
//    
//    double timestamp = (double)([newDate timeIntervalSince1970]+8*3600)*1000;
//    long result = [[NSNumber numberWithDouble:timestamp] longValue];
//    NSString *timestampStr = [NSString stringWithFormat:@"%ld",result];
//    return timestampStr;
//}
//
//+ (NSString *)getTimeWithTimeStamp:(NSString *)timestamp
//{
//    NSTimeInterval now = [[NSDate date] timeIntervalSince1970]*1;
//    NSString *timeString = nil;
//    NSString *lateDateStr = [self CertaintimeWithTimeIntervalString:timestamp];
//    //时间差
//    NSTimeInterval cha = now - [timestamp doubleValue];
//    if (cha/3600<1) {
//        timeString = [NSString stringWithFormat:@"%f", cha/60];
//        timeString = [timeString substringToIndex:timeString.length-7];
//        timeString= [timeString intValue]==0?@"刚刚":[NSString stringWithFormat:@"%@分钟前", timeString];
//    }
//    if (cha/3600>1&&cha/86400<1) {
//        timeString = [NSString stringWithFormat:@"%f", cha/3600];
//        timeString = [timeString substringToIndex:timeString.length-7];
//        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
//    }
//    if (cha/86400>1&&cha/86400<=5)
//    {
//        timeString = [NSString stringWithFormat:@"%f", cha/86400];
//        timeString = [timeString substringToIndex:timeString.length-7];
//        timeString=[NSString stringWithFormat:@"%@天前", timeString];
//    }
//    if (cha/86400>5) {
//        timeString = lateDateStr;
//    }
//    return timeString;
//}
//
//+ (NSString *)getHourMuniteSecond:(NSString *)timestamp
//{
//    long timeInterval = [timestamp longValue];
//    long hour = timeInterval/3600;
//    long minute = timeInterval%3600/60;
//    long second = timeInterval%3600%60;
//    NSString *timestr = @"0秒";
//    if (hour>0&&minute>0&&second>0) {
//        timestr = [NSString stringWithFormat:@"%02ld时%02ld分%02ld秒",hour,minute,second];
//    }if (hour>0&&minute>0&&second==0){
//        timestr = [NSString stringWithFormat:@"%02ld时%02ld分",hour,minute];
//    }if (hour>0&&minute==0&&second>0){
//        timestr = [NSString stringWithFormat:@"%02ld时%02ld秒",hour,second];
//    }if (hour==0&&minute>0&&second>0) {
//        timestr = [NSString stringWithFormat:@"%02ld分%02ld秒",minute,second];
//    }if (hour>0&&minute==0&&second==0) {
//        timestr = [NSString stringWithFormat:@"%02ld时00分00秒",hour];
//    }if (hour==0&&minute>0&&second==0) {
//        timestr = [NSString stringWithFormat:@"%02ld分00秒",minute];
//    }if (hour==0&&minute==0&&second>0) {
//        timestr = [NSString stringWithFormat:@"%02ld秒",second];
//    }
//    return timestr;
//}
//#pragma mark - 倒计时天数
//+ (int)countDownDays:(NSString *)dateStr
//{
//    //获取到期日期的时间戳
//    long timestamp = [[Helper getTimeStamp:dateStr dateFormat:@"yyyy-MM-dd"] longValue];
//    //获取当前时间的时间戳
//    long nowstamp = [[Helper getNowTimestamp] longValue];
//    //时间差
//    long cha = timestamp - nowstamp;
//    long days = cha/(24*3600*1000);
//    if (days<1) {
//        days = 0;
//    }
//    return (int)days;
//}
//
//#pragma mark - 手机号
//+ (BOOL)validatePhoneWithString:(NSString *)phoneNumber
//{
//    //    NSString *phoneRegex = @"^[0-9]{6,14}$";
//    //    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
//    
//    //    return [phoneTest evaluateWithObject:phoneNumber];
//    
//    if (phoneNumber.length != 11)
//    {
//        return NO;
//    }
//    /**
//     * 手机号码:
//     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
//     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
//     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
//     * 电信号段: 133,153,180,181,189,177,1700
//     */
//    NSString *MOBILE = @"^1((3[0-9]|4[57]|5[0-35-9]|7[05678]|8[0-9])\\d{8}$)";
//    /**
//     * 中国移动：China Mobile
//     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
//     */
//    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
//    /**
//     * 中国联通：China Unicom
//     * 130,131,132,155,156,185,186,145,176,175,1709
//     */
//    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[56]|8[56])\\d{8}$)|(^1709\\d{7}$)";
//    /**
//     * 中国电信：China Telecom
//     * 133,153,180,181,189,177,1700
//     */
//    NSString *CT = @"(^1(33|53|7[73]|8[019])\\d{8}$)|(^1700\\d{7}$)";
//    
//    
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//    
//    if (([regextestmobile evaluateWithObject:phoneNumber] == YES)
//        || ([regextestcm evaluateWithObject:phoneNumber] == YES)
//        || ([regextestct evaluateWithObject:phoneNumber] == YES)
//        || ([regextestcu evaluateWithObject:phoneNumber] == YES))
//    {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//    
//}
//
//+ (BOOL) deptNumInputShouldNumber:(NSString *)str
//{
//    NSString *regex = @"[0-9]*";
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
//    if ([pred evaluateWithObject:str]) {
//        return YES;
//    }
//    return NO;
//}
//
////判断字符串是否为空
//+ (BOOL)validateNullString:(NSString *)str
//{
//    if (str.length==0 || str==nil || [str isKindOfClass:[NSNull class]]) {
//        return YES;
//    }
//    return NO;
//}
//
//+ (BOOL)validateStrContainAlphaNum:(NSString *)tempStr
//{
//    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"];
//    set = [set invertedSet];
//    NSRange range = [tempStr rangeOfCharacterFromSet:set];
//    if (range.location!=NSNotFound) {
//        return  NO;
//    }
//    return YES;
//}
//
////获取当前视图所在控制器
//+ (UIViewController *)getCurControllerWithView:(UIView *)view
//{
//    UIViewController *vc = nil;
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    if (window.windowLevel != UIWindowLevelNormal) {
//        NSArray *windows = [UIApplication sharedApplication].windows;
//        
//        for (UIWindow *win in windows) {
//            if (win.windowLevel == UIWindowLevelNormal) {
//                window = win;
//                break;
//            }
//        }
//    }
//    
//    UIView *frontView = [[window subviews] firstObject];
//    id nextResponse = [frontView nextResponder];
//    if ([nextResponse isKindOfClass:[UIViewController class]]) {
//        vc = nextResponse;
//    }else{
//        vc = window.rootViewController;
//    }
//    return vc;
//}
//
//+ (UIViewController *)getCurrentVCInWindow
//{
//    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
//    while (1) {
//        if ([vc isKindOfClass:[UITabBarController class]]) {
//            vc = ((UITabBarController *)vc).selectedViewController;
//        }if ([vc isKindOfClass:[UINavigationController class]]){
//            vc = ((UINavigationController *)vc).visibleViewController;
//        }if(vc.presentedViewController){
//            vc = vc.presentedViewController;
//        }else{
//            break;
//        }
//    }
//    return vc;
//}
//
//+ (NSString*)deviceString
//{
//    // 需要#import "sys/utsname.h"
//    struct utsname systemInfo;
//    uname(&systemInfo);
//    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
//    
//    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G (A1203)";
//    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G (A1241/A1324)";
//    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS (A1303/A1325)";
//    if ([platform isEqualToString:@"iPhone3,1"]) return iPhone4;
//    if ([platform isEqualToString:@"iPhone3,2"]) return iPhone4;
//    if ([platform isEqualToString:@"iPhone3,3"]) return iPhone4;
//    if ([platform isEqualToString:@"iPhone4,1"]) return iPhone4;
//    if ([platform isEqualToString:@"iPhone5,1"]) return iPhone5;
//    if ([platform isEqualToString:@"iPhone5,2"]) return iPhone5;
//    if ([platform isEqualToString:@"iPhone5,3"]) return iPhone5;
//    if ([platform isEqualToString:@"iPhone5,4"]) return iPhone5;
//    if ([platform isEqualToString:@"iPhone6,1"]) return iPhone5;
//    if ([platform isEqualToString:@"iPhone6,2"]) return iPhone5;
//    if ([platform isEqualToString:@"iPhone7,1"]) return iPhone6Plus;
//    if ([platform isEqualToString:@"iPhone7,2"]) return iPhone6;
//    if ([platform isEqualToString:@"iPhone8,1"]) return iPhone6;
//    if ([platform isEqualToString:@"iPhone8,2"]) return iPhone6Plus;
//    if ([platform isEqualToString:@"iPhone8,4"]) return iPhone5;
//    if ([platform isEqualToString:@"iPhone9,1"]) return iPhone6;//iPhone7
//    if ([platform isEqualToString:@"iPhone9,2"]) return iPhone6Plus;//iPhone7Plus
//    
//    if ([platform isEqualToString:@"iPhone10,1"]) return iPhone8;
//    if ([platform isEqualToString:@"iPhone10,4"]) return iPhone8;
//    if ([platform isEqualToString:@"iPhone10,2"]) return iPhone8Plus;
//    if ([platform isEqualToString:@"iPhone10,5"]) return iPhone8Plus;
//    if ([platform isEqualToString:@"iPhone10,3"]) return iPhoneX;
//    if ([platform isEqualToString:@"iPhone10,6"]) return iPhoneX;
//    
//    
//    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G (A1213)";
//    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G (A1288)";
//    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G (A1318)";
//    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G (A1367)";
//    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G (A1421/A1509)";
//    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G (A1219/A1337)";
//    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2 (A1395)";
//    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2 (A1396)";
//    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2 (A1397)";
//    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2 (A1395+New Chip)";
//    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G (A1432)";
//    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G (A1454)";
//    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G (A1455)";
//    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3 (A1416)";
//    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3 (A1403)";
//    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3 (A1430)";
//    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4 (A1458)";
//    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4 (A1459)";
//    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4 (A1460)";
//    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air (A1474)";
//    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air (A1475)";
//    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air (A1476)";
//    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G (A1489)";
//    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G (A1490)";
//    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G (A1491)";
//    if ([platform isEqualToString:@"i386"])      return iPhoneX;//
//    if ([platform isEqualToString:@"x86_64"])    return iPhoneX;//todo
//    return platform;
//}
//
//+ (NSString *)safePhone:(NSString *)phonenum
//{
//    if (phonenum.length!=11) {
//        return phonenum;
//    }else{
//        NSString *safeStr = [phonenum stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
//        return safeStr;
//    }
//}
//
//+ (UIAlertController *)createAlertCWithTitle:(NSString *)title message:(NSString *)msg alertType:(UIAlertControllerStyle)alertType actionTitleArr:(NSArray *)actionTitleArr handler:(void (^)(NSInteger actionIndex))handler
//{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:alertType];
//    for (NSString *title in actionTitleArr) {
//       NSInteger index = [actionTitleArr indexOfObject:title];
//        
//        if ([title isEqualToString:@"取消"]) {
//            UIAlertAction *cancelaction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            }];
//            [alert addAction:cancelaction];
//        }else{
//            UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                handler(index);
//            }];
//            [alert addAction:action];
//        }
//    }
//    return alert;
//}
//
//#pragma mark - 指定范围内的随机数
//+ (int)getRandomNum:(int)from to:(int)to
//{
//    return (int)(from+(arc4random()%(to-from+1)));
//}
//
////本地视频时长，大小
//+ (NSDictionary *)getLocalVideoSizeAndTimeWithSourcePath:(NSString *)path{
//    AVURLAsset * asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:path]];
//    CMTime   time = [asset duration];
//    int seconds = ceil(time.value/time.timescale);
//    
//    NSInteger fileSize = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil].fileSize;
//    
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    dic[@"size"] = @(fileSize);
//    dic[@"duration"] = @(seconds);
//    return dic;
//}
//
////将视频文件格式转换为MP4
//+ (void)convertMovTypeIntoMp4TypeWithSourceUrl:(NSURL *)sourceUrl convertSuccess:(void (^)(NSURL *path))convertSuccess {
//    
//    [self createVideoFolderIfNotExist];
//    
//    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:sourceUrl options:nil];
//    
//    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
//    
//    //    BWJLog(@"%@",compatiblePresets);
//    
//    if ([compatiblePresets containsObject:AVAssetExportPresetHighestQuality]) {
//        
//        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:AVAssetExportPresetHighestQuality];
//        
//        
//        NSString * resultPath = [self getVideoMergeFilePathString];
//        
//        NSLog(@"resultPath = %@",resultPath);
//        
//        
//        exportSession.outputURL = [NSURL fileURLWithPath:resultPath];
//        
//        exportSession.outputFileType = AVFileTypeMPEG4;
//        
//        exportSession.shouldOptimizeForNetworkUse = YES;
//        
//        [exportSession exportAsynchronouslyWithCompletionHandler:^{
//            dispatch_async(dispatch_get_main_queue(), ^{
//                if (exportSession.status == AVAssetExportSessionStatusCompleted) {
//                    if (convertSuccess) {
//                        convertSuccess([NSURL fileURLWithPath:resultPath]);
//                    }
//                } else {
//                    
//                    
//                }
//            });
//            
//        }];
//    }
//}
//
//+ (void)createVideoFolderIfNotExist
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [paths objectAtIndex:0];
//    
//    NSString *folderPath = [path stringByAppendingPathComponent:VIDEO_FOLDER];
//    
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    BOOL isDir = NO;
//    BOOL isDirExist = [fileManager fileExistsAtPath:folderPath isDirectory:&isDir];
//    
//    if(!(isDirExist && isDir))
//    {
//        BOOL bCreateDir = [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
//        if(!bCreateDir){
//            
//        }
//    }
//}
//
//+ (NSString *)getVideoMergeFilePathString
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path = [paths objectAtIndex:0];
//    
//    path = [path stringByAppendingPathComponent:VIDEO_FOLDER];
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyyMMddHHmmss";
//    NSString *nowTimeStr = [formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:0]];
//    
//    NSString *fileName = [[path stringByAppendingPathComponent:nowTimeStr] stringByAppendingString:@"merge.mp4"];
//    
//    return fileName;
//}
//
//+ (UIImage *)scaleImg:(UIImage *)oraginalImg toScale:(CGFloat)scaleSize
//{
//    UIGraphicsBeginImageContext(CGSizeMake(oraginalImg.size.width*scaleSize, oraginalImg.size.height*scaleSize));
//    [oraginalImg drawInRect:CGRectMake(0, 0, oraginalImg.size.width*scaleSize, oraginalImg.size.height*scaleSize)];
//    UIImage *scaleImg = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return scaleImg;
//}
//
//+ (NSString *)getMP3FileWithOrinalFile:(NSString *)originalFilePath MP3FilePath:(NSString *)mp3Path
//{
//    NSString *urlStr=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    
//    NSString *cafFilePath =[urlStr stringByAppendingPathComponent:originalFilePath];//caf文件路径
//    NSString *mp3FilePath = [urlStr stringByAppendingPathComponent:mp3Path];//存储mp3文件的路径
//    
//    NSFileManager * fileManager=[ NSFileManager defaultManager ];
//    
//    if ([fileManager fileExistsAtPath:cafFilePath]){
//        
//        float msize= [[fileManager attributesOfItemAtPath:cafFilePath error:nil] fileSize]/(1024.0*1024.0);
//        
//        NSLog(@"caf文件大小%lf",msize);
//        
//    }else{
//        
//        float msize= [[fileManager attributesOfItemAtPath:@"myRecordForMp3.mp3" error:nil] fileSize]/(1024.0*1024.0);
//        
//        NSLog(@"mp3文件大小%lf",msize);
//    }
//    if ([fileManager removeItemAtPath :mp3FilePath error : nil ])
//    {
//        NSLog ( @" 删除 " );
//    }
//    @try {
//        
//        int read, write;
//        
//        FILE *pcm = fopen([cafFilePath cStringUsingEncoding:1], "rb");  //source 被转换的音频文件位置
//        fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
//        FILE *mp3 = fopen([mp3FilePath cStringUsingEncoding:1], "wb");  //output 输出生成的Mp3文件位置
//        
//        const int PCM_SIZE = 8192;
//        const int MP3_SIZE = 8192;
//        short int pcm_buffer[PCM_SIZE*2];
//        unsigned char mp3_buffer[MP3_SIZE];
//        
//        lame_t lame = lame_init();
//        lame_set_num_channels(lame,1);//设置1为单通道，默认为2双通道
//        lame_set_in_samplerate(lame, 44100.0);
//        lame_set_VBR(lame, vbr_default);
//        
//        lame_set_brate(lame,8);
//        
//        lame_set_mode(lame,3);
//        
//        lame_set_quality(lame,2);
//        
//        lame_init_params(lame);
//        
//        do {
//            read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
//            if (read == 0)
//                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
//            else
//                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
//            
//            fwrite(mp3_buffer, write, 1, mp3);
//            
//        } while (read != 0);
//        
//        lame_close(lame);
//        fclose(mp3);
//        fclose(pcm);
//    }
//    @catch (NSException *exception) {
//        NSLog(@"%@",[exception description]);
//    }
//    @finally {
//        NSLog(@"执行完成");
//        return mp3FilePath;
//    }
//}
//
//+ (BOOL)isFileExistAtPath:(NSString*)fileFullPath {
//    BOOL isExist = NO;
//    isExist = [[NSFileManager defaultManager] fileExistsAtPath:fileFullPath];
//    return isExist;
//}
//
//+ (NSString *)getImagePath:(UIImage *)image filename:(NSString *)filename
//{
//    NSString *filePath = nil;
//    NSData *data = nil;
//    if (UIImagePNGRepresentation(image)==nil) {
//        data = UIImageJPEGRepresentation(image, 1.0);
//    }else{
//        data = UIImagePNGRepresentation(image);
//    }
//    //图片保存路径
//    //将图片放在沙盒的documents文件中
//    NSString *documentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//    //文件管理器
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    //把图片转成data对象拷贝到沙盒中
//    [fileManager createDirectoryAtPath:documentsPath withIntermediateDirectories:YES attributes:nil error:nil];
//    //    NSString *imgPath = @"/userAvatar.png";
//    [fileManager createFileAtPath:[documentsPath stringByAppendingString:filename] contents:data attributes:nil];
//    //得到沙盒中图片的完整路径
//    filePath = [NSString stringWithFormat:@"%@/%@",documentsPath,filename];
//    [data writeToFile:filePath atomically:YES];
//    return filePath;
//}
//
//+ (void)setcornerRadiusWithView:(UIView *)view radius:(CGFloat)radius
//{
//    view.layer.cornerRadius = radius;
//    view.layer.masksToBounds = YES;
//}
//
//+ (void)setBorderWithwidth:(CGFloat)width color:(UIColor *)color view:(UIView *)view
//{
//    view.layer.borderWidth = width;
//    view.layer.borderColor = color.CGColor;
//}
//
//+ (void)setborderWithwidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)radius view:(UIView *)view
//{
//    view.layer.cornerRadius = radius;
//    view.layer.masksToBounds = YES;
//    view.layer.borderWidth = width;
//    view.layer.borderColor = color.CGColor;
//    
//}
//
//+ (void)showError:(id)err
//{
//    if (err) {
//        if([err isKindOfClass:[NSString class]]){
//            [DCHTipView showErrorWithTip:err];
//        }else{
////            NSError *error = (NSError *)err;
////            [DCHTipView showErrorWithTip:error.localizedDescription];
//            [DCHTipView showErrorWithTip:@"服务器开小差啦~"];
//        }
//    }else{
////        [DCHTipView showErrorWithTip:@"出错啦，请稍后再试吧~"];
//    }
//    NSLog(@"error==%@",err);
//}
//
//+ (NSString *)dictToJsonStr:(NSDictionary *)dict
//{
//    NSError *error = nil;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    //    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    //    NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
//    return jsonString;
//}
//
//+ (NSString *)arryToJsonStr:(NSArray *)array
//{
//    NSError *error = nil;
//    //    NSMutableArray *muArray = [NSMutableArray array];
//    //    for (NSString *userId in array) {
//    //        [muArray addObject:[NSString stringWithFormat:@"\"%@\"", userId]];
//    //    }
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
//    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    //    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    //    NSString *jsonResult = [jsonTemp stringByReplacingOccurrencesOfString:@" " withString:@""];
//    //    NSLog(@"json array is: %@", jsonResult);
//    return jsonString;
//}
//
//+ (NSDictionary *)jsonToDict:(NSString *)jsonStr
//{
//    if (jsonStr==nil) {
//        return nil;
//    }
//    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *err = nil;
//    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
//    if (err) {
//        DCHLog(@"解析失败");
//        return nil;
//    }
//    return dict;
//}
//
//+ (NSArray *)jsonToArr:(NSString *)jsonStr
//{
//    if (!jsonStr) {
//        return nil;
//    }
//    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *err = nil;
//    NSArray *arr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
//    if (err) {
//        DCHLog(@"解析失败");
//        return nil;
//    }
//    return arr;
//}
//
///**
// 把普通的url转换为拼接了baseUrl的url
// 
// @param url 普通的url
// @return 拼接baseurl之后的地址
// */
//+ (NSString *)converUrlToFullUrl:(NSString *)url{
//    /*! 检查地址中是否有中文 */
//    NSString *URLString = [NSURL URLWithString:url] ? url : [self strUTF8Encoding:url];
//    if ([URLString hasPrefix:@"http"]) {
//        return URLString;
//    }else{
//        return [NSString stringWithFormat:@"%@%@",Base_Url,URLString];
//        
//    }
//}
//
//+ (NSString *)strUTF8Encoding:(NSString *)str
//{
//    if ([NSURL URLWithString:str]) {
//        return str;
//    }
//    /*! ios9适配的话 打开第一个 */
//    return [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
//    //    return [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//}
//
//+ (NSString *)converUrlToFullUrls:(NSString *)url{
//    /*! 检查地址中是否有中文 */
//    NSString *URLString = [NSURL URLWithString:url] ? url : [self strUTF8Encoding:url];
//    if ([URLString hasPrefix:@"http"]) {
//        return URLString;
//    }else{
//        return [NSString stringWithFormat:@"%@",URLString];
//    }
//}
//
//#pragma mark - 生成文件路径
//+ (NSString*)GetPathByFileName:(NSString *)_fileName ofType:(NSString *)_type{
//    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];;
//    NSString* fileDirectory = [[[directory stringByAppendingPathComponent:_fileName]
//                                stringByAppendingPathExtension:_type]
//                               stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    return fileDirectory;
//}
//
//+ (NSString *)saveFileDirectPath:(NSString *)directName
//{
//    NSFileManager *fileMgr = [NSFileManager defaultManager];
//    //指向文件目录
//    NSString *documentsDirectory= [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//    NSString *savePath=[NSString stringWithFormat:@"%@/%@", documentsDirectory,directName];
//    
//    if (![fileMgr fileExistsAtPath:savePath]) {
//        [fileMgr createDirectoryAtPath:savePath withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    return savePath;
//}
//
//+ (void)saveImgToLocalAtPath:(NSString *)filePath img:(UIImage *)img
//{
//    NSData *imgData = UIImageJPEGRepresentation(img, 1);
//    [imgData writeToFile:filePath atomically:YES];
//}
//
//+ (NSMutableArray *)getFilenamelistOfType:(NSString *)type fromDirPath:(NSString *)dirPath
//{
//    NSMutableArray *filenamelist = [[NSMutableArray alloc]init];
//    //    NSString *temporaryDirectory = NSHomeDirectory();
//    //    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSArray *tmplist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:nil];
//    
//    for (NSString *filename in tmplist) {
//        NSString *fullpath = [dirPath stringByAppendingPathComponent:filename];
//        
//        if ([Helper isFileExistAtPath:fullpath]) {
//            if ([[filename pathExtension] isEqualToString:type]) {
//                NSURL *url = [NSURL fileURLWithPath:fullpath];
//                CGFloat duration = [Helper audioSoundDuration:url];
//                AudioModel *ob=[[AudioModel alloc]init];
//                ob.audioRecoderName=filename;
//                ob.audioRecoderPath=fullpath;
//                ob.audioRecoderIsChecked=NO;
//                ob.audioDuration = duration;
//                [filenamelist addObject:ob];
//            }
//        }
//    }
//    return filenamelist;
//}
//
//+ (void)removeFilesWithType:(NSString *)type dirPath:(NSString *)dirPath
//{
//    NSArray *tmplist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:nil];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    for (NSString *filename in tmplist) {
//        NSString *fullpath = [dirPath stringByAppendingPathComponent:filename];
//        if ([Helper isFileExistAtPath:fullpath]) {
//            if ([[filename pathExtension] isEqualToString:type]) {
//                [fileManager removeItemAtPath:fullpath error:nil];
//                
//            }
//        }
//    }
//}
//
//
//+ (void)removeFilesWithType:(NSString *)type dirPath:(NSString *)dirPath finish:(void(^)(void))finish
//{
//    NSArray *list = [Helper getFilenamelistOfType:type fromDirPath:dirPath];
//    NSArray *tmplist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dirPath error:nil];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSMutableArray *removedArr = [NSMutableArray array];
//    [removedArr removeAllObjects];
//    for (NSString *filename in tmplist) {
//        NSString *fullpath = [dirPath stringByAppendingPathComponent:filename];
//        if ([Helper isFileExistAtPath:fullpath]) {
//            
//            if ([[filename pathExtension] isEqualToString:type]) {
//                [fileManager removeItemAtPath:fullpath error:nil];
//                [removedArr addObject:filename];
//            }
//        }
//    }
//    if (removedArr.count==list.count) {
//        finish();
//    }
//}
//
//+ (void)removesingleFilesWithFilePath:(NSString *)filePath
//{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    if ([Helper isFileExistAtPath:filePath]) {
//        [fileManager removeItemAtPath:filePath error:nil];
//    }
//}
//
//#pragma mark - 将请求的URL文件存在本地
//+ (NSString *)saveUrlFileToLocal:(NSString *)filename
//{
//    NSString *file = filename;
//    NSArray *fileArr = nil;
//    NSString *filetype = @"wav";
//    if ([filename containsString:@"."]) {
//        fileArr = [filename componentsSeparatedByString:@"."];
//        file = fileArr[0];
//        filetype = fileArr[1];
//    }
//    NSString *filepath = [Helper GetPathByFileName:file ofType:filetype];
//    [Helper removesingleFilesWithFilePath:filepath];
//    if (![Helper isFileExistAtPath:filepath]) {//如果不存在就存储 存在就不存
//        NSString *urlStr = [NSString stringWithFormat:@"%@%@",IMG_Domain_Url,filename];
//        NSURL *url1 = [[NSURL alloc]initWithString:urlStr];
//        NSData * audioData = [NSData dataWithContentsOfURL:url1];
//        [audioData writeToFile:filepath atomically:YES];
//    }
//    return filepath;
//}
//
//+ (CGFloat)audioSoundDuration:(NSURL *)fileUrl{
//    NSDictionary *options = @{AVURLAssetPreferPreciseDurationAndTimingKey: @YES};
//    AVURLAsset *audioAsset = [AVURLAsset URLAssetWithURL:fileUrl options:options];
//    CMTime audioDuration = audioAsset.duration;
//    float audioDurationSeconds = CMTimeGetSeconds(audioDuration);
//    return audioDurationSeconds;
//}
//
//+ (UIImage *)getUrlImage:(NSString  *)imgUrlstr
//{
//    UIImage *img = nil;
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    NSURL *imgUrl  = [NSURL URLWithString:ImgUrlStr([Helper strUTF8Encoding:imgUrlstr])];
//    BOOL isExistcache = [manager diskImageExistsForURL:imgUrl];
//    if (isExistcache) {
//        img = [[manager imageCache] imageFromDiskCacheForKey:imgUrl.absoluteString];
//    }else{
//        NSData *imgData = [[NSData alloc] initWithContentsOfURL:imgUrl];
//        img = [UIImage imageWithData:imgData];
//    }
//    return img;
//}
//
//+ (NSString *)getLocalcacheSize
//{
//    long totalSize = 0;
//    NSFileManager *manager = [NSFileManager defaultManager];
//    //获取音频缓存文件
//    //获取音频缓存所在目录路径
//    NSString *audioFilePath = [Helper saveFileDirectPath:AudiofilePrexPath];
//    if ([manager fileExistsAtPath:audioFilePath]) {
//        totalSize = [[manager attributesOfItemAtPath:audioFilePath error:nil] fileSize];
//    }
//    long SDSize = [[SDImageCache sharedImageCache] getSize];
//    totalSize+=SDSize;
//    NSString *sizeStr = nil;
//    if (totalSize>1024*1024) {
//        sizeStr = [NSString stringWithFormat:@"%.2fM",totalSize/(1024.0f*1024.0f)];
//    }else if (totalSize>1024.0){
//        sizeStr = [NSString stringWithFormat:@"%.2fK",totalSize/1024.0];
//    }else{
//        sizeStr = [NSString stringWithFormat:@"%.2fB",totalSize/1.0f];
//    }
//    return sizeStr;
//}
//
//+ (BOOL)clearCache:(void(^)())finish
//{
//    //获取所有子路径
//    NSString *audioFilePath = [Helper saveFileDirectPath:AudiofilePrexPath];
//    //删除子文件
//    NSError *error = nil;
//    [[NSFileManager defaultManager]removeItemAtPath:audioFilePath error:&error];
//    if (error) {
//        return NO;
//    }
//    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
//        finish();
//    }];
//    return YES;
//}
//
//+ (CGFloat)getVolume:(float)decibels
//{
//    float level;// The linear 0.0 .. 1.0 value we need.
//    float minDecibels = -80.0f; // Or use -60dB, which I measured in a silent room.
//    if (decibels < minDecibels){
//        level = 0.0f;
//    }else if (decibels >= 0.0f){
//        level = 1.0f;
//    }else{
//        float root = 2.0f;
//        
//        float minAmp = powf(10.0f, 0.05f * minDecibels);
//        
//        float inverseAmpRange = 1.0f / (1.0f - minAmp);
//        
//        float amp = powf(10.0f, 0.05f * decibels);
//        
//        float adjAmp = (amp - minAmp) * inverseAmpRange;
//        
//        level = powf(adjAmp, 1.0f / root);
//    }
//    float ben=level*120;
//    return ben;
//}
//
//+ (UILabel *)createLabelWithText: (NSString *)text textColor:(UIColor *)textColor labelFont:(UIFont *)font {
//    NSString *string = [NSString stringWithFormat:@"%@", text];
//    CGFloat width = [Helper textWidth:text font:font textHeight:30];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
//    label.font = font;
//    label.text = string;
//    label.textColor = textColor;
//    return label;
//}
//
//+ (BOOL)isUpdateWithCompareVersion:(NSString *)newVersion
//{
//    NSString *curVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//    NSArray *curvesionArr = [curVersion componentsSeparatedByString:@"."];
//    NSArray *newVersionArr = [newVersion componentsSeparatedByString:@"."];
//    
//    int curpreValue = [curvesionArr[0] intValue];
//    int newpreValue = [newVersionArr[0] intValue];
//    
//    int curcenterValue = [curvesionArr[1] intValue];
//    int newcenterValue = [newVersionArr[1] intValue];
//    
//    int curendValue = 0,newendValue = 0;
//    if (curvesionArr.count==3) {
//        curendValue = [curvesionArr[2] intValue];
//    }if (newVersionArr.count==3) {
//        newendValue = [newVersionArr[2] intValue];
//    }
//    
//    if (newpreValue>curpreValue) {
//        return YES;
//    }else{
//        if (newpreValue==curpreValue&&newcenterValue>curcenterValue) {
//            return YES;
//        }else{
//            if(newcenterValue==curcenterValue&&newendValue>curendValue){
//                return YES;
//            }else{
//                return NO;
//            }
//        }
//    }
//}

@end

//
//  NSDate+Extensions.h
//  HosApp
//
//  Created by HSH-D-2213 on 15-1-24.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>
#define YYYY_MM_dd_hh_mm_ss  @"yyyy-MM-dd HH:mm:ss"
#define YYYY_MM_dd           @"YYYY-MM-dd"
#define YYYYMMdd             @"YYYYMMdd"
#define yyyyMMdd             @"yyyMMdd"
#define HH_mm                @"HH:mm"
#define mm_ss                @"mm:ss"
#define HH_mm_ss                @"HH:mm:ss"
#define YYYY_MM_dd_dot           @"YYYY.MM.dd"
typedef enum{
    TimeLocationEarly,
    TimeLocationSame,
    TimeLocationLatter
}TimeLocation;

@interface NSDate(Extensions)
+ (NSString *)converTime:(NSTimeInterval)time withFormatterString:(NSString *)formatterStr;
+ (NSString *)converDate:(NSDate *)date withFormatterString:(NSString *)formatterStr;

//time1,time2 formatter @"YYYY-MM-dd"
+ (TimeLocation)isTime:(NSString *)time1 earlyThanTime:(NSString *)time2;

+ (NSString *)timeNow;
+ (NSString *)timeNowWithoutDote;
+ (NSTimeInterval)timeNowDouble;

+ (BOOL)isTime:(NSTimeInterval)time1 sameDayToTime:(NSTimeInterval)time2;

//秒转为01:23:10格式
+ (NSString *)convertTimeWithSecond:(NSTimeInterval)time;
@end


@interface NSDate (ScheduleDate)
+ (NSString *)monthOfTime:(NSTimeInterval)time;//一月，十一月
+ (NSString *)weekOfTime:(NSTimeInterval)time;//周一，周二，周日
+ (NSString *)monthdayOfTime:(NSTimeInterval)time;//1.12 ,11.07
+ (NSString *)dayOfTime:(NSTimeInterval)time;//12日 ,07日
+ (NSString *)kickOffTime:(NSTimeInterval)time;//15:00

@end


@interface NSDate (IMStyle)
+ (NSString*)messageDateStringFrom:(NSTimeInterval) timestamp;//显示为周几，前天，昨天，今天，上午，下午等。
+ (NSDate *)extractDate:(NSDate *)date;
+ (NSInteger)dayOffsetfrom:(NSTimeInterval)timestamp;
@end


@interface NSDate (CommentStyle)

+ (NSString*)commentDateStringFrom:(NSTimeInterval) timestamp;//显示为xx小时前，xx 天前，x 月 x 日，xxxx 年 x 月 x 日。
@end



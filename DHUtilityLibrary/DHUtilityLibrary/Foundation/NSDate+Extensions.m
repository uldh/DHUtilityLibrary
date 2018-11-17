//
//  NSDate+Extensions.m
//  HosApp
//
//  Created by HSH-D-2213 on 15-1-24.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate(Extensions)
+(NSString *)converTime:(NSTimeInterval)time withFormatterString:(NSString *)formatterStr
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    return [formatter stringFromDate:date];
}

+ (NSString *)converDate:(NSDate *)date withFormatterString:(NSString *)formatterStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterStr];
    return [formatter stringFromDate:date];
}

+ (TimeLocation)isTime:(NSString *)time1 earlyThanTime:(NSString *)time2
{
    if ([time1 isEqual:[NSNull null]]) {
        time1 = @"0000-00-00";
    }
    if ([time2 isEqual:[NSNull null]]) {
        time2 = @"0000-00-00";
    }

    NSArray * array1 = [time1 componentsSeparatedByString:@"-"];
    NSArray * array2 = [time2 componentsSeparatedByString:@"-"];
    
    for (int i = 0; i < 3; i++) {
        NSInteger data1 = 0;
        NSInteger data2 = 0;
        if(array1.count > i){//防崩
            data1 = [[array1 objectAtIndex:i]integerValue];
        }
        if(array2.count > i){
            data2 = [[array2 objectAtIndex:i]integerValue];
        }
        
        if (data1 < data2) {
            return TimeLocationEarly;
        }else if(data1 > data2){
            return TimeLocationLatter;
        }else{
            continue;
        }
    }
    return TimeLocationSame;
}

+ (NSString *)timeNow{
    return [NSString stringWithFormat:@"%lf",[[NSDate date] timeIntervalSince1970]];
}

+ (NSString *)timeNowWithoutDote{
    NSString * timeNow = [NSDate timeNow];
    NSArray * arrayTemp = [timeNow componentsSeparatedByString:@"."];
    NSString * str = [arrayTemp componentsJoinedByString:@""];
    return str;
}


+ (NSTimeInterval)timeNowDouble{
    return [[NSDate date] timeIntervalSince1970];
}

+ (BOOL)isTime:(NSTimeInterval)time1 sameDayToTime:(NSTimeInterval)time2{
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:time1];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:time2];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    NSString* day1 = [formatter stringFromDate:date1];
    NSString* day2 = [formatter stringFromDate:date2];
    
    if ([day1 isEqualToString:day2] && (fabs(time1 - time2) < 24*60*60)) {
        return YES;
    }else{
        return NO;
    }
}

+ (NSString *)convertTimeWithSecond:(NSTimeInterval)time{//秒转为01:23:10格式
    NSInteger h = (NSInteger)time/3600;
    NSInteger m = (time-h*3600)/60;
    NSInteger s = (NSInteger)(time-h*3600) % (NSInteger)60;
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",h,m,s];
}

@end

@implementation NSDate (ForMatchSchedule)
+ (NSString *)monthOfTime:(NSTimeInterval)time{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger month = [comps month];
    NSArray * months = @[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月"];
    NSString * monthString;
    if (month >= 1 && month <= 12) {
        monthString = [months objectAtIndex:(month -1)];
    }else{
        monthString = @"未知";
    }
    return monthString;

}
+ (NSString *)weekOfTime:(NSTimeInterval)time{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday];
    NSArray * weekDays = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    NSString * weekString;
    if (week >= 1 && week <= 7) {
        weekString = [weekDays objectAtIndex:(week -1)];
    }else{
        weekString = @"未知";
    }
    return weekString;
}

+ (NSString *)monthdayOfTime:(NSTimeInterval)time{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatterFinal = [[NSDateFormatter alloc] init];
    [formatterFinal setDateFormat:@"MM.dd"];
    NSString* day = [formatterFinal stringFromDate:date];
    if ([day characterAtIndex:0] == '0') {
        return [day substringFromIndex:1];
    }else{
        return day;
    }
}
+(NSString *)dayOfTime:(NSTimeInterval)time{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatterFinal = [[NSDateFormatter alloc] init];
    [formatterFinal setDateFormat:@"dd"];
    NSString* day = [formatterFinal stringFromDate:date];
    return [NSString stringWithFormat:@"%@日",day];
}
+ (NSString *)kickOffTime:(NSTimeInterval)time{
    if (fabs(time - 0.0) <0.1) {
        return @"";
    }else{
        return [NSString stringWithFormat:@"%@  ",[NSDate converTime:time withFormatterString:@"HH:mm"]];
    }    
}
@end


@implementation NSDate (IMStyle)
+ (NSString *)getPeriodOfTime:(NSInteger)time withMinute:(NSInteger)minute{
    NSInteger totalMin = time *60 + minute;
    NSString *showPeriodOfTime = @"";
    if (totalMin > 0 && totalMin <= 5 * 60){
        showPeriodOfTime = @"凌晨";
    }else if (totalMin > 5 * 60 && totalMin < 12 * 60){
        showPeriodOfTime = @"上午";
    }else if (totalMin >= 12 * 60 && totalMin <= 18 * 60){
        showPeriodOfTime = @"下午";
    }else if ((totalMin > 18 * 60 && totalMin <= (23 * 60 + 59)) || totalMin == 0){
        showPeriodOfTime = @"晚上";
    }
    return showPeriodOfTime;
}

+(NSString*)weekdayStr:(NSInteger)dayOfWeek{
    static NSDictionary *daysOfWeekDict = nil;
    daysOfWeekDict = @{@(0):@"星期日",
                       @(1):@"星期一",
                       @(2):@"星期二",
                       @(3):@"星期三",
                       @(4):@"星期四",
                       @(5):@"星期五",
                       @(6):@"星期六",
                       @(7):@"星期日"};
    return [daysOfWeekDict objectForKey:@(dayOfWeek)];
}


+ (NSString*)messageDateStringFrom:(NSTimeInterval) timestamp {
    NSDate * nowDate = [NSDate date];    //今天的时间
    NSDate * msgDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *result = nil;
    NSCalendarUnit components = (NSCalendarUnit)(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitHour | NSCalendarUnitMinute);
    NSDateComponents *nowDateComponents = [[NSCalendar currentCalendar] components:components fromDate:nowDate];
    NSDateComponents *msgDateComponents = [[NSCalendar currentCalendar] components:components fromDate:msgDate];
    
    if(nowDateComponents.day == msgDateComponents.day){//同一天,显示时间
        NSInteger hour = msgDateComponents.hour;
        result = [NSDate getPeriodOfTime:hour withMinute:msgDateComponents.minute];
        if (hour > 12){
            hour = hour - 12;
        }
        result = [[NSString alloc] initWithFormat:@"%@ %zd:%02d",result,hour,(int)msgDateComponents.minute];
    }else if(nowDateComponents.day == (msgDateComponents.day+1)){//昨天
        result = @"昨天";
    }else if(nowDateComponents.day == (msgDateComponents.day+2)) {//前天
        result = @"前天";
    }else if([nowDate timeIntervalSinceDate:msgDate] < 7 * 24*60*60){//一周内
        result = [NSDate weekdayStr:msgDateComponents.weekday];
    }else {//显示日期
        result = [NSString stringWithFormat:@"%zd-%zd-%zd", msgDateComponents.year, msgDateComponents.month, msgDateComponents.day];
    }
    return result;
}

+ (NSDate *)extractDate:(NSDate *)date {
    //get seconds since 1970
    NSTimeInterval interval = [date timeIntervalSince1970];
    int daySeconds = 24 * 60 * 60;
    //calculate integer type of days
    NSInteger allDays = interval / daySeconds;
    
    return [NSDate dateWithTimeIntervalSince1970:allDays * daySeconds];
}

+ (NSInteger)dayOffsetfrom:(NSTimeInterval)timestamp {
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate * nowDate = [NSDate date];    //今天的时间
    NSDate * msgDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    nowDate = [formatter dateFromString:[formatter stringFromDate:nowDate]];
    msgDate = [formatter dateFromString:[formatter stringFromDate:msgDate]];
    
    NSTimeInterval diff = [nowDate timeIntervalSinceDate:msgDate];
    int days=((int)diff)/(3600*24);
    return days;
}
@end



@implementation NSDate(CommentStyle)

+ (NSString*)commentDateStringFrom:(NSTimeInterval) timestamp{
    NSDate * nowDate = [NSDate date];    //今天的时间
    NSDate * msgDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *result = nil;

    NSCalendarUnit components = (NSCalendarUnit)(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitHour | NSCalendarUnitMinute);
    NSDateComponents *nowDateComponents = [[NSCalendar currentCalendar] components:components fromDate:nowDate];
    NSDateComponents *msgDateComponents = [[NSCalendar currentCalendar] components:components fromDate:msgDate];
    
    if(nowDateComponents.day == msgDateComponents.day){//小于24小时，展示XX小时前
        NSInteger hour = msgDateComponents.hour;
        result = [NSDate getPeriodOfTime:hour withMinute:msgDateComponents.minute];
        if (hour > 12){
            hour = hour - 12;
        }
        result = [[NSString alloc] initWithFormat:@"%ld小时前",(long)(nowDateComponents.hour-msgDateComponents.hour)];
    }else if((nowDateComponents.day > msgDateComponents.day)&&(nowDateComponents.day <(msgDateComponents.day+7))){//大于24小时，小于一周，展示X天前
        result = [NSString stringWithFormat:@"%ld天前",(long)(nowDateComponents.day - msgDateComponents.day)];
    }else if((nowDateComponents.day >=(msgDateComponents.day+7))&&((nowDateComponents.year == msgDateComponents.year))) {//大于一周，小于一年展示，X月X日
        result = [NSString stringWithFormat:@"%ld月%ld日",(long)msgDateComponents.month,(long)msgDateComponents.day];
    }else if(nowDateComponents.year > msgDateComponents.year){//大于一年，展示XXXX年X月X日
        result = [NSString stringWithFormat:@"%ld年%ld月%ld日",(long)msgDateComponents.year,(long)msgDateComponents.month,(long)msgDateComponents.day];
    }
    return result;
}
@end



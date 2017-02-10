//
//  DateUnit.m
//  STAdditionsDemo
//
//  Created by ShaoFeng on 2017/2/10.
//  Copyright © 2017年 ShaoFeng. All rights reserved.
//
//
#import "DateUnit.h"

@implementation CompareResult
@end

@implementation DateUnit

+ (NSString *)getCurrentDataWithDateFormate:(NSString *)formate
{
    NSDate *now = [NSDate date];
    return [self dateFormattingWithDate:now toFormate:formate];
}

+ (NSString *)dateFormattingWithDate:(NSDate *)date toFormate:(NSString *)formate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    return [formatter stringFromDate:date];
}

+ (NSDate *)returnToDay0Clock
{
    NSDate *now = [NSDate date];
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calender components:unitFlags fromDate:now];
    int hour = (int)[dateComponent hour];
    int minute = (int)[dateComponent minute];
    int second = (int)[dateComponent second];
    //当前时分秒:hour,minute,second
    //返回当前时间(hour * 3600 + minute * 60 + second)之前的时间,即为今天凌晨0点
    NSDate *nowDay = [NSDate dateWithTimeIntervalSinceNow: - (hour * 3600 + minute * 60 + second)];
    long long inter = [nowDay timeIntervalSince1970] * 1000;
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:inter / 1000];
    return newDate;
}

+ (NSDate *)returnToDay24Clock
{
    NSDate *now = [NSDate date];
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calender components:unitFlags fromDate:now];
    int hour = (int)[dateComponent hour];
    int minute = (int)[dateComponent minute];
    int second = (int)[dateComponent second];
    //一天是60分钟 * 60秒 * 24小时 = 86400秒
    NSDate *nextDay = [NSDate dateWithTimeIntervalSinceNow: - (hour * 3600 + minute * 60 + second) + 86400];
    return nextDay;
}

+ (long long)getCurrentDateSecond
{
    return [[NSDate date] timeIntervalSince1970];
}

+ (long long)dateTosecond:(NSDate *)date
{
    return [date timeIntervalSince1970];
}

+ (NSDate *)secondToDate:(long long)second
{
    return [NSDate dateWithTimeIntervalSince1970:second];
}

+ (BOOL)is12HourSystem
{
    NSString *formatStringForHour = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale autoupdatingCurrentLocale]];
    NSRange contains = [formatStringForHour rangeOfString:@"a"];
    BOOL is12HourSystem = contains.location != NSNotFound;
    return is12HourSystem;
}

+ (NSString *)dateDisplayResult:(long long)secondCount
{
    NSDate *date = [self secondToDate:secondCount];
    NSCalendar *calender = [NSCalendar currentCalendar];
    //判断是否是今天
    if ([calender isDateInToday:date]) {

        long long dateSecondCount = [[NSDate date] timeIntervalSinceDate:date];
        if (dateSecondCount < 60) {
            return @"刚刚";
        }
        if (dateSecondCount < (60 * 60)) {
            return [NSString stringWithFormat:@"%d分钟前",(int)(dateSecondCount / 60)];
        }
        return [NSString stringWithFormat:@"%d小时前",(int)(dateSecondCount / (60 * 60))];
    }
    
    //判断是否是昨天
    NSString *formatterString = @" HH:mm";
    if ([calender isDateInYesterday:date]) {
        formatterString = [@"昨天" stringByAppendingString:formatterString];
    } else {
        //判断是否是一年内
        formatterString = [@"MM-dd" stringByAppendingString:formatterString];
        //判断是否值一年之前
        NSDateComponents *component = [calender components:NSCalendarUnitYear fromDate:date toDate:[NSDate date] options:NSCalendarWrapComponents];
        
        if (component.year >= 1) {
            formatterString = [@"YYYY-" stringByAppendingString:formatterString];
        }
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    return [formatter stringFromDate:date];
}

+ (CompareResult *)compareDateDifferenceDate1:(NSDate *)date1 date2:(NSDate *)date2
{
    CompareResult *result = [[CompareResult alloc] init];
    result.value = (fabs([date1 timeIntervalSinceDate:date2]));
    result.trend = [date1 compare:date2];
    return result;
}

@end

//
//  timeObject.m
//  TimeObject
//
//  Created by Luoh on 2018/7/25.
//  Copyright © 2018年 timeObject. All rights reserved.
//

#import "timeObject.h"

@implementation timeObject


+(timeObject *)sharedInstance
{
    static timeObject * time;
    static dispatch_once_t timeObjecteronce;
    dispatch_once(&timeObjecteronce, ^{
        time = [[timeObject alloc] init];
        
    });
    return time;
}

#pragma mark -- 获取当前时间
+ (NSString *)getCurrentTimesAndreturnType:(returnTimeType)returnType{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    switch (returnType) {
        case TimewWithMinus:
            [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        case TimewWithColon:
            [formatter setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
            break;
        case TimewWithHan:
            [formatter setDateFormat:@"yyyy年MM月dd日 HH分mm秒ss毫秒"];
            break;
        default:
            break;
    }
    
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

+ (NSString *)getCurrentTimesAndreturnTypeWithAMPM{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.AMSymbol = @"上午";
    format.PMSymbol = @"下午";
    format.dateFormat = @"yyyy-MM-dd aaa HH:mm:ss";
    NSDate *datenow = [NSDate date];
    NSString *timeStr = [format stringFromDate:datenow];
    return timeStr;
}

#pragma mark -- 获取当前时间戳有两种方法(以秒为单位)
+ (NSString *)getNowTimeTimestampWithString{
    NSDate * date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time = [date timeIntervalSince1970];// *1000 是精确到毫秒，不乘就是精确到秒
//    NSTimeInterval time = [date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

#pragma mark -- 时间戳转时间
// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
+ (NSString *)getNowTimeWithTimestamp:(NSString *)str returnType:(returnTimeType)returnType{
    //传入的时间戳str如果是精确到毫秒的记得要/1000
    NSTimeInterval time=[str doubleValue];
    //传入的时间戳str如果是精确到毫秒的记得要/1000
//    NSTimeInterval time=[str doubleValue]/1000;
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    
    
    //设定时间格式,这里可以设置成自己需要的格式
    switch (returnType) {
        case TimewWithMinus:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
        case TimewWithColon:
            [dateFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
            break;
        case TimewWithHan:
            [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH分mm秒ss毫秒"];
            break;
        default:
            break;
    }
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}

#pragma mark -- 字符串转时间戳
+ (NSString *)getTimeStrWithString:(NSString *)str{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:str];//将字符串转换为时间对象
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]];
//    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]*1000];//字符串转成时间戳,精确到毫秒*1000
    return timeStr;
}

+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        //NSLog(@"oneDay比 anotherDay时间晚");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"oneDay比 anotherDay时间早");
        return -1;
    }
    //NSLog(@"两者时间是同一个时间");
    return 0;
}

+ (int)compareOneDayString:(NSString *)oneDayString withAnotherDayString:(NSString *)anotherDayString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *dateA = [dateFormatter dateFromString:oneDayString];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayString];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        //NSLog(@"oneDay比 anotherDay时间晚");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"oneDay比 anotherDay时间早");
        return -1;
    }
    //NSLog(@"两者时间是同一个时间");
    return 0;
    
}

#pragma mark -- 时间处理
+ (NSString *)getTimeWithYearMonthDay:(NSString *)timeString{
    return [timeString substringWithRange:NSMakeRange(0, 10)];
}

+ (NSString *)getTimeWithMonthDayHM:(NSString *)timeString{
    return [timeString substringWithRange:NSMakeRange(5, 11)];
}


+ (NSString *)ChatingTime:(NSString *)timestring{
    
    int timestamp=  [timestring intValue];
    // 创建日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获取当前时间
    NSDate *currentDate = [NSDate date];
    // 获取当前时间的年、月、日。利用日历
    NSDateComponents *components = [calendar components:NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    NSInteger currentYear = components.year;
    NSInteger currentMonth = components.month;
    NSInteger currentDay = components.day;
    // 获取消息发送时间的年、月、日
    NSDate *msgDate = [NSDate dateWithTimeIntervalSince1970:timestamp];
    components = [calendar components:NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour fromDate:msgDate];
//    CGFloat msgYear = components.year;
//    CGFloat msgMonth = components.month;
//    CGFloat msgDay = components.day;
//    CGFloat msghours = components.hour;
    
    
    float msgYear = components.year;
    float msgMonth = components.month;
    float msgDay = components.day;
    float msghours = components.hour;
    // 进行判断
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc] init];
    if (currentYear == msgYear && currentMonth == msgMonth && currentDay == msgDay) {
        //今天
        if (msghours<12) {
            dateFmt.dateFormat = @"上午 hh:mm";
        }else{
            dateFmt.dateFormat = @"下午 hh:mm";
        }
        
    }else if (currentYear == msgYear && currentMonth == msgMonth && currentDay - 1 == msgDay ){
        //昨天
        dateFmt.dateFormat = @"昨天 HH:mm";
    }
    else if (currentYear == msgYear && currentMonth == msgMonth && currentDay - 2 == msgDay ){
        //前天
        dateFmt.dateFormat = @"前天 HH:mm";
    }
    else if (currentYear == msgYear && currentMonth == msgMonth && currentDay + 1 == msgDay ){
        //明天
        dateFmt.dateFormat = @"明天 HH:mm";
    }
    else if (currentYear == msgYear && currentMonth == msgMonth && currentDay + 2 == msgDay ){
        //后天
        dateFmt.dateFormat = @"后天 HH:mm";
    }
    else{
        //昨天以前
        dateFmt.dateFormat = @"MM-dd HH:mm";
    }
    // 返回处理后的结果
    return [dateFmt stringFromDate:msgDate];
    
}

#pragma mark -- 获取年、月、日、时、分、秒
+ (int)getYearMonthAnd{
    
    NSDate *now = [NSDate date];
    NSLog(@"now date is: %@", now);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    int year =(int) [dateComponent year];
    int month = (int) [dateComponent month];
    int day = (int) [dateComponent day];
    int hour = (int) [dateComponent hour];
    int minute = (int) [dateComponent minute];
    int second = (int) [dateComponent second];
    
//    NSInteger year = [dateComponent year];
//    NSInteger month =  [dateComponent month];
//    NSInteger day = [dateComponent day];
//    NSInteger hour =  [dateComponent hour];
//    NSInteger minute =  [dateComponent minute];
//    NSInteger second = [dateComponent second];
    
    
    NSLog(@"year is: %ld", (long)year);
    NSLog(@"month is: %ld", (long)month);
    NSLog(@"day is: %ld", (long)day);
    NSLog(@" hour is: %ld",  (long)hour);
    NSLog(@"minute  is: %ld", (long)minute );
    NSLog(@"second is: %ld", (long)second);
    //字符串的转化并且拼接
    NSString *yearstr=[NSString stringWithFormat:@"%ld-",(long)year];
    NSString *monthstr=[NSString stringWithFormat:@"%ld-",(long)month];
    NSString *daystr=[NSString stringWithFormat:@"%ld ",(long)day];
    NSString *hourstr=[NSString stringWithFormat:@"%ld:",(long)hour];
    NSString *minutestr=[NSString stringWithFormat:@"%ld:",(long)minute];
    NSString *secondstr=[NSString stringWithFormat:@"%ld",(long)second];
    //字符串开始拼接
    NSString *allstr=[yearstr stringByAppendingString:monthstr];
    NSString *allstr1=[allstr stringByAppendingString:daystr];
    NSString *allstr2=[allstr1 stringByAppendingString:hourstr];
    NSString *allstr3=[allstr2 stringByAppendingString:minutestr];
    NSString *DateTime=[allstr3 stringByAppendingString:secondstr];
    NSLog(@"最后年月日时分秒拼接的结果=====%@",DateTime);
    
    return 1;
}


@end

//
//  timeObject.h
//  TimeObject
//
//  Created by Luoh on 2018/7/25.
//  Copyright © 2018年 timeObject. All rights reserved.
//

#import <Foundation/Foundation.h>

///时间格式 TimewWithMinus = 0 ///eg.1970-01-01    TimewWithColon ///eg.1970:00:00    TimewWithHan ///eg.1970年00月00日
enum returnTimeType {
    TimewWithMinus = 0, ///eg.1970-01-01
    TimewWithColon,     ///eg.1970:00:00
    TimewWithHan        ///eg.1970年00月00日
};
typedef enum returnTimeType returnTimeType;

@interface timeObject : NSObject
/**
    初始化单例
    时间相关
 */
+(timeObject *)sharedInstance;
/** 获取当前时间 */
+ (NSString*)getCurrentTimesAndreturnType:(returnTimeType)returnType;

+ (NSString *)getCurrentTimesAndreturnTypeWithAMPM;
/** 获取当前时间戳 */
+ (NSString *)getNowTimeTimestampWithString;
/** 时间戳转时间 */
+ (NSString *)getNowTimeWithTimestamp:(NSString *)str returnType:(returnTimeType)returnType;
/** 字符串转时间戳 如：2017-4-10 17:15:10 */
+ (NSString *)getTimeStrWithString:(NSString *)str;
/** 时间比大小 */
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
+ (int)compareOneDayString:(NSString *)oneDayString withAnotherDayString:(NSString *)anotherDayString;
/** 处理时间 只要年月日 */
+ (NSString *)getTimeWithYearMonthDay:(NSString *)timeString;
/** 处理时间 只要月日  时分*/
+ (NSString *)getTimeWithMonthDayHM:(NSString *)timeString;
/** 聊天经常用的那种时间 上午下午 昨天今天  传时间戳*/
+ (NSString *)ChatingTime:(NSString *)timestring;
+ (int)getYearMonthAnd;

@end

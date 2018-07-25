# TimeManagerWith
iOS 获取时间处理时间等
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

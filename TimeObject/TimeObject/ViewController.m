//
//  ViewController.m
//  TimeObject
//
//  Created by Luoh on 2018/7/25.
//  Copyright © 2018年 timeObject. All rights reserved.
//

#import "ViewController.h"
#import "timeObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"hello world");
    
    /** 获取当前时间 */
    NSLog(@"%@",[timeObject getCurrentTimesAndreturnType:TimewWithMinus]);
    
    /** ... */
    NSLog(@"%@",[timeObject getCurrentTimesAndreturnTypeWithAMPM]);
    
    /** 获取当前时间戳 返回值为str */
    NSLog(@"%@",[timeObject getNowTimeTimestampWithString]);
    
    /** 时间戳转时间 */
    NSLog(@"%@",[timeObject getNowTimeWithTimestamp:[timeObject getNowTimeTimestampWithString] returnType:TimewWithMinus]);
    
    
    /** 时间转时间戳 */
    NSLog(@"%@",[timeObject getTimeStrWithString:[timeObject getCurrentTimesAndreturnType:TimewWithMinus]]);
    
    NSString * startTime = @"2018-01-01 00:00:00";
    NSString * endTime = @"2018-01-02 00:00:00";
    NSLog(@"%d",[timeObject compareOneDayString:startTime withAnotherDayString:endTime]);
    
    
    /** 将当前时间处理为年月日 */
    NSLog(@"%@",[timeObject getTimeWithYearMonthDay:[timeObject getCurrentTimesAndreturnType:TimewWithMinus]]);
    /** 将当前时间处理为月日时分 */
    NSLog(@"%@",[timeObject getTimeWithMonthDayHM:[timeObject getCurrentTimesAndreturnType:TimewWithMinus]]);
    
    
    /** 聊天时间 */
    NSLog(@"聊天时间                %@",[timeObject ChatingTime:[timeObject getNowTimeTimestampWithString]]);
    NSLog(@"聊天时间                %@",[timeObject ChatingTime:[timeObject getTimeStrWithString:@"2018-07-23 22:37:00"]]);
    NSLog(@"聊天时间                %@",[timeObject ChatingTime:[timeObject getTimeStrWithString:@"2018-07-24 22:37:00"]]);
    NSLog(@"聊天时间                %@",[timeObject ChatingTime:[timeObject getTimeStrWithString:@"2018-07-25 10:37:00"]]);
    NSLog(@"聊天时间                %@",[timeObject ChatingTime:[timeObject getTimeStrWithString:@"2018-07-25 22:37:00"]]);
    NSLog(@"聊天时间                %@",[timeObject ChatingTime:[timeObject getTimeStrWithString:@"2018-07-26 22:37:00"]]);
    NSLog(@"聊天时间                %@",[timeObject ChatingTime:[timeObject getTimeStrWithString:@"2018-07-27 22:37:00"]]);
    
    
    NSLog(@"%d年月日 分开 获取",[timeObject getYearMonthAnd]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

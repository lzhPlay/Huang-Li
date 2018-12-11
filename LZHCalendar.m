//
//  LZHCalendar.m
//  treasure
//
//  Created by 李占豪 on 2018/11/9.
//  Copyright © 2018 李占豪. All rights reserved.
//

#import "LZHCalendar.h"
#import "LZHHuangLi.h"
@interface LZHCalendar()

@end
@implementation LZHCalendar
//根据date获取日
- (NSInteger)convertDateToDay:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitDay) fromDate:date];
    return [components day];
}

//根据date获取月
- (NSInteger)convertDateToMonth:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitMonth) fromDate:date];
    return [components month];
}

//根据date获取年
- (NSInteger)convertDateToYear:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear) fromDate:date];
    return [components year];
}

//根据date获取当月周几 (美国时间周日-周六为 1-7,改为0-6方便计算)
- (NSInteger)convertDateToWeekDay:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:date];
    NSInteger weekDay = [components weekday] - 1;
    weekDay = MAX(weekDay, 0);
    return weekDay;
}

//根据date获取当月周几
- (NSInteger)convertDateToFirstWeekDay:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [calendar dateFromComponents:comp];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    return firstWeekday - 1;  //美国时间周日为星期的第一天，所以周日-周六为1-7，改为0-6方便计算
}

//根据date获取当月总天数
- (NSInteger)convertDateToTotalDays:(NSDate *)date {
    NSRange daysInOfMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return daysInOfMonth.length;
}

//根据date获取偏移指定天数的date
- (NSDate *)getDateFrom:(NSDate *)date offsetDays:(NSInteger)offsetDays {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    [lastMonthComps setDay:offsetDays];  //year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    NSDate *newdate = [calendar dateByAddingComponents:lastMonthComps toDate:date options:0];
    return newdate;
}

//根据date获取偏移指定月数的date
- (NSDate *)getDateFrom:(NSDate *)date offsetMonths:(NSInteger)offsetMonths {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    [lastMonthComps setMonth:offsetMonths];  //year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    NSDate *newdate = [calendar dateByAddingComponents:lastMonthComps toDate:date options:0];
    return newdate;
}

//根据date获取偏移指定年数的date
- (NSDate *)getDateFrom:(NSDate *)date offsetYears:(NSInteger)offsetYears {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *lastMonthComps = [[NSDateComponents alloc] init];
    [lastMonthComps setYear:offsetYears];  //year = 1表示1年后的时间 year = -1为1年前的日期，month day 类推
    NSDate *newdate = [calendar dateByAddingComponents:lastMonthComps toDate:date options:0];
    return newdate;
}

- (void)test {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    for (int i = 1; i <= 12; i++) {
        NSString *string = [NSString stringWithFormat:@"2018-%02d-01",i];
        NSDate *date = [dateFormatter dateFromString:string];
        [self logCalendarWith:date];
    }
}

- (void)logCalendarWith:(NSDate *)date {
//    NSInteger year = [self convertDateToYear:date];
    NSInteger month = [self convertDateToMonth:date];
//    NSInteger day = [self convertDateToDay:date];
    NSInteger firstWeekDay = [self convertDateToFirstWeekDay:date];
    NSInteger totalDays = [self convertDateToTotalDays:date];
    
    printf("第%ld月\n",month);
    
    NSInteger line = totalDays <= 28 ? 4 : 5;
    NSInteger column = 7;
    
    NSInteger available = 1;    //超过总天数后为下月
    NSInteger nextMonthDay = 1; //下月天数开始计数
    
    NSDate *lastMonthDate = [self getDateFrom:date offsetMonths:-1];    //上月月数
    NSInteger lastMonthTotalDays = [self convertDateToTotalDays:lastMonthDate]; //上月天数计数
    
    for (int i = 0; i < line; i++) {
        for (int j = 0; j < column; j++) {
            if (available > totalDays) {
                printf("\t%ld ",nextMonthDay++);
                continue;
            }
            
            if (i == 0 && j < firstWeekDay) {
                NSInteger lastMonthDay = lastMonthTotalDays - firstWeekDay + j + 1; //j从0开始，所以这里+1
                printf("\t%ld ",lastMonthDay);
            }else {
                printf("\t%ld",available++);
            }
        }
        printf("\n");
    }
    printf("\n");
    printf("\n");
}


@end

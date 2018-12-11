//
//  LZHHuangLi.m
//  treasure
//
//  Created by 李占豪 on 2018/11/5.
//  Copyright © 2018 李占豪. All rights reserved.
//

#import "LZHHuangLi.h"
@interface LZHHuangLi ()



//月份
@property (nonatomic,strong) NSArray * chineseNumber;
//天干
@property (nonatomic,strong) NSArray * heavenly;
//地支
@property (nonatomic,strong) NSArray * earthlyBranch;

@property (nonatomic,strong) NSArray * lunarInfo;
//甲子
@property (nonatomic,strong) NSArray * jiaZi;

@property (nonatomic,strong) NSArray * pZuGan;
@property (nonatomic,strong) NSArray * pZuZhi;
@end
@implementation LZHHuangLi
-(NSArray *)pZuGan{
    if (!_pZuGan) {
        _pZuGan = @[@"甲不开仓财物耗散",@"乙不栽植千株不长",@"丙不修灶必见灾殃",@"丁不剃头头必生疮",@"戊不受田田主不祥",
                    @"己不破券二比并亡",@"庚不经络织机虚张",@"辛不合酱主人不尝",@"壬不汲水更难提防",@"癸不词讼理弱敌强"
                    ];
    }
    return _pZuGan;
}
-(NSArray *)pZuZhi{
    if (!_pZuZhi) {
        _pZuZhi = @[
                    @"子不问卜自惹祸殃",@"丑不冠带主不还乡",@"寅不祭祀神鬼不尝",@"卯不穿井水泉不香",@"辰不哭泣必主重丧",@"巳不远行财物伏藏",
                    @"午不苫盖屋主更张",@"未不服药毒气入肠",@"申不安床鬼祟入房",@"酉不宴客醉坐颠狂",@"戌不吃犬作怪上床",@"亥不嫁娶不利新郎"
                    ];
    }
    return _pZuZhi;
}
-(NSArray *)chineseNumber{
    if (!_chineseNumber) {
        _chineseNumber = @[@"正", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九", @"十", @"十一", @"腊"];
    }
    return _chineseNumber;
}

-(NSArray *)heavenly{
    if (!_heavenly) {
        _heavenly = @[@"甲", @"乙", @"丙", @"丁", @"戊", @"己", @"庚", @"辛", @"壬", @"癸"];
    }
    return _heavenly;
}

-(NSArray *)earthlyBranch{
    if (!_earthlyBranch) {
        _earthlyBranch = @[@"子", @"丑", @"寅", @"卯", @"辰", @"巳", @"午", @"未", @"申", @"酉", @"戌", @"亥"];
    }
    return _earthlyBranch;
}
//每一个源表示该年共多少天
/*二进制表示
 
  xxxx    xxxx    xxxx    xxxx    xxxx
 20-17    16-12    12-9    8-5    4-1
 1-4: 表示当年有无闰年，有的话，为闰月的月份，没有的话，为0。
 
 5-16：为除了闰月外的正常月份是大月还是小月，1为30天，0为29天。
 注意：从1月到12月对应的是第16位到第5位。
 17-20： 表示闰月是大月还是小月，仅当存在闰月的情况下有意义。
 */
-(NSArray *)lunarInfo{
    if (!_lunarInfo) {
        _lunarInfo  = @[@0x04bd8, @0x04ae0,@0x0a570,@0x054d5,@0x0d260,@0x0d950,@0x16554,@0x056a0,@0x09ad0,@0x055d2,
                        @0x04ae0,@0x0a5b6,@0x0a4d0,@0x0d250,@0x1d255,@0x0b540,@0x0d6a0,@0x0ada2,@0x095b0,@0x14977,
                        @0x04970,@0x0a4b0,@0x0b4b5,@0x06a50,@0x06d40,@0x1ab54,@0x02b60,@0x09570,@0x052f2,@0x04970,
                        @0x06566,@0x0d4a0,@0x0ea50,@0x06e95,@0x05ad0,@0x02b60,@0x186e3,@0x092e0,@0x1c8d7,@0x0c950,
                        @0x0d4a0,@0x1d8a6,@0x0b550,@0x056a0,@0x1a5b4,@0x025d0,@0x092d0,@0x0d2b2,@0x0a950,@0x0b557,
                        @0x06ca0,@0x0b550,@0x15355,@0x04da0,@0x0a5d0,@0x14573,@0x052d0,@0x0a9a8,@0x0e950,@0x06aa0,
                        @0x0aea6,@0x0ab50,@0x04b60,@0x0aae4,@0x0a570,@0x05260,@0x0f263,@0x0d950,@0x05b57,@0x056a0,
                        @0x096d0,@0x04dd5,@0x04ad0,@0x0a4d0,@0x0d4d4,@0x0d250,@0x0d558,@0x0b540,@0x0b5a0,@0x195a6,
                        @0x095b0,@0x049b0,@0x0a974,@0x0a4b0,@0x0b27a,@0x06a50,@0x06d40,@0x0af46,@0x0ab60,@0x09570,
                        @0x04af5,@0x04970,@0x064b0,@0x074a3,@0x0ea50,@0x06b58,@0x055c0,@0x0ab60,@0x096d5,@0x092e0,
                        @0x0c960,@0x0d954,@0x0d4a0,@0x0da50,@0x07552,@0x056a0,@0x0abb7,@0x025d0,@0x092d0,@0x0cab5,
                        @0x0a950,@0x0b4a0,@0x0baa4,@0x0ad50,@0x055d9,@0x04ba0,@0x0a5b0,@0x15176,@0x052b0,@0x0a930,
                        @0x07954,@0x06aa0,@0x0ad50,@0x05b52,@0x04b60,@0x0a6e6,@0x0a4e0,@0x0d260,@0x0ea65,@0x0d530,
                        @0x05aa0,@0x076a3,@0x096d0,@0x04bd7,@0x04ad0,@0x0a4d0,@0x1d0b6,@0x0d250,@0x0d520,@0x0dd45,
                        @0x0b5a0,@0x056d0,@0x055b2,@0x049b0,@0x0a577,@0x0a4b0,@0x0aa50,@0x1b255,@0x06d20,@0x0ada0
                        ];
    }
    return _lunarInfo;
}
/**
 * 六十甲子
 */
-(NSArray *)jiaZi{
    if (!_jiaZi) {
        _jiaZi = @[@"甲子",@"乙丑",@"丙寅",@"丁卯",@"戊辰",@"己巳",@"庚午",@"辛未",@"壬申",@"癸酉",
                  @"甲戌",@"乙亥",@"丙子",@"丁丑",@"戊寅",@"己卯",@"庚辰",@"辛巳",@"壬午",@"癸未",
                  @"甲申",@"乙酉",@"丙戌",@"丁亥",@"戊子",@"己丑",@"庚寅",@"辛卯",@"壬辰",@"癸巳",
                  @"甲午",@"乙未",@"丙申",@"丁酉",@"戊戌",@"己亥",@"庚子",@"辛丑",@"壬寅",@"癸卯",
                  @"甲辰",@"乙巳",@"丙午",@"丁未",@"戊申",@"己酉",@"庚戌",@"辛亥",@"壬子",@"癸丑",
                  @"甲寅",@"乙卯",@"丙辰",@"丁巳",@"戊午",@"己未",@"庚申",@"辛酉",@"壬戌",@"癸亥"
                   ];
    }
    return _jiaZi;
}

/**
 * @param hour 这里的时间范围是1-12，具体几点到几点是子时、丑时请参考相关文档
 * 具体的选择如下 "子：1", "丑：2", "寅：3", "卯：4", "辰：5", "巳：6", "午：7", "未：8", "申：9", "酉：10", "戌：11", "亥：12"
 * @author kongqz
 * */
//
-(NSString*)getYearGanZhi:(int)hour{
    //1864年是甲子年，每隔六十年一个甲子
    NSInteger idx = (_year - 1864) % 60;
    //没有过春节的话那么年还算上一年的，此处求的年份的干支
    NSString * y = self.jiaZi[idx];
    NSString * d=@"";
    idx = idx % 5;
    NSInteger idxm=0;
    /**
     * 年上起月
     * 甲己之年丙作首，乙庚之岁戊为头，
     * 丙辛必定寻庚起，丁壬壬位顺行流，
     * 更有戊癸何方觅，甲寅之上好追求。
     */
    idxm=(idx+1)*2;
    if(idxm==10){
        idxm=0;
    }
    //求的月份的干支
    NSString * m=[NSString stringWithFormat:@"%@%@",self.heavenly[(idxm+_month-1)%10],self.earthlyBranch[(_month+2-1)%12]];
    /*求出和1900年1月31日甲辰日相差的天数
     * 甲辰日是第四十天
     */
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd"];//设置时间格式//很重要
    NSDate *day1=[date dateFromString:self.timer];
    NSDate *day2=[date dateFromString:@"1900-01-31"];
    //求出和1900年1月31日相差的天数
    NSInteger offset = [self numberOfDaysWithFromDate:day2 toDate:day1];
    offset=(offset+40)%60;
    //求的日的干支
    d=self.jiaZi[offset];
    _jBranch = d;
    /**
     * 日上起时
     * 甲己还生甲，乙庚丙作初，
     * 丙辛从戊起，丁壬庚子居，
     * 戊癸何方发，壬子是真途。
     */
    
    offset=(offset % 5 )*2;
    //求得时辰的干支
    NSString * h=[NSString stringWithFormat:@"%@%@",self.heavenly[(offset+hour)%10],self.earthlyBranch[hour]];
    //在此处输出我们的年月日时的天干地支
    NSString * str = [NSString stringWithFormat:@"%@,%@,%@,%@",y,m,d,h];
    return str;
}
//====== 传回农历 y年的总天数
-(int)yearDays:(NSInteger)y{
    int i,  sum = 348;
    NSInteger a = [self.lunarInfo[y - 1900] integerValue];
    for (i = 0x8000; i > 0x8; i >>= 1) {
        if ((a & i) != 0) {
            sum += 1;
        }
    }
    return (sum + [self leapDays:y]);
}
//====== 传回农历 y年闰月的天数
-(int)leapDays:(NSInteger)y{
    if ([self leapMonth:y] != 0) {
        NSInteger a = [self.lunarInfo[y - 1900] integerValue];
        if ((a & 0x10000) != 0) {
            return 30;
        } else {
            return 29;
        }
    } else {
        return 0;
    }
}
//====== 传回农历 y年闰哪个月 1-12 , 没闰传回 0
-(NSInteger)leapMonth:(NSInteger)y{
    NSInteger a = [self.lunarInfo[y - 1900] integerValue];
    return (a & 0xf);
}
//====== 传回农历 y年m月的总天数
-(NSInteger)monthDays:(NSInteger)y days:(NSInteger)m{
    if (([self.lunarInfo[y - 1900] integerValue] & (0x10000 >> m)) == 0) {
        return 29;
    } else {
        return 30;
    }

}
/***
 * @return 传回农历 y年的生肖
 */
-(NSString*)animalsYear{
    NSArray * Animals = @[@"鼠",@"牛",@"虎",@"兔",@"龙",@"蛇",@"马",@"羊",@"猴",@"鸡",@"狗",@"猪"];
    return Animals[(_year - 4) % 12];
}
//====== 传入 月日的offset 传回干支, 0=甲子
-(NSString*)cyclicalm:(NSInteger)num{
    NSString * gan = self.heavenly[num%10];
    gan = [gan stringByAppendingString:self.earthlyBranch[num%12]];
    return gan;
    
}

//====== 传入 offset 传回干支, 0=甲子
-(NSString*)cyclical{
    NSInteger num = _year - 1900 + 36;
    return [self cyclicalm:num];
}
/**
 * 传出y年m月d日对应的农历.
 * yearCyl3:农历年与1864的相差数 ?
 * monCyl4:从1900年1月31日以来,闰月数
 * dayCyl5:与1900年1月31日相差的天数,再加40 ?
 *
 * @param time 时间
 */
-(void)baZi:(NSString*)time{
    self.timer = time;
    NSInteger yearCyl,  monCyl,  dayCyl;
    NSInteger leapMonth = 0;
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd"];//设置时间格式//很重要
    NSDate *day1=[date dateFromString:time];
    NSDate *day2=[date dateFromString:@"1900-01-31"];
    //求出和1900年1月31日相差的天数
    NSInteger offset = [self numberOfDaysWithFromDate:day2 toDate:day1];
    dayCyl = offset + 40;
    monCyl = 14;
    //用offset减去每农历年的天数
    // 计算当天是农历第几天
    //i最终结果是农历的年份
    //offset是当年的第几天
    int iYear,  daysOfYear = 0;
    for (iYear = 1900; iYear < 2050 && offset > 0; iYear++) {
        daysOfYear = [self yearDays:iYear];
        offset -= daysOfYear;
        monCyl += 12;
    }
    if (offset < 0) {
        offset += daysOfYear;
        iYear--;
        monCyl -= 12;
    }
    
    //农历年份
    _year = iYear;
    yearCyl = iYear - 1864;
    leapMonth = [self leapMonth:iYear]; //闰哪个月,1-12
    _leap = false;
    //用当年的天数offset,逐个减去每月（农历）的天数，求出当天是本月的第几天
    NSInteger iMonth,  daysOfMonth = 0;
    for (iMonth = 1; iMonth < 13 && offset > 0; iMonth++) {
        //闰月
        if (leapMonth > 0 && iMonth == (leapMonth + 1) && !_leap) {
            --iMonth;
            _leap = true;
            daysOfMonth = [self leapDays:_year];
        } else {
            daysOfMonth = [self monthDays:_year days:iMonth];
        }
        offset -= daysOfMonth;
        //解除闰月
        if (_leap && iMonth == (leapMonth + 1)) {
            _leap = false;
        }
        if (!_leap) {
            monCyl++;
        }
    }
    
    //offset为0时，并且刚才计算的月份是闰月，要校正
    if (offset == 0 && leapMonth > 0 && iMonth == leapMonth + 1) {
        if (_leap) {
            _leap = false;
        } else {
            _leap = true;
            --iMonth;
            --monCyl;
        }
    }
    //offset小于0时，也要校正
    if (offset < 0) {
        offset += daysOfMonth;
        --iMonth;
        --monCyl;
    }
    _month = iMonth;
    _day = offset + 1;
}

//把数字日期转换成中文的日期。比如 10 = 初十。11 = 十一
-(NSString*)getChinaDayString:(NSInteger)day{
    NSArray * chineseTen = @[@"初",@"十",@"廿",@"卅"];
    int n = day % 10 == 0 ? 9 : day % 10 - 1;
    if (day > 30) {
        return @"";
    }
    if (day == 10) {
        return @"初十";
    } else {
        NSString * string  = [NSString stringWithFormat:@"%@%@",chineseTen[day / 10],self.chineseNumber[n]];
        return  string;
    }
}

-(NSString*)toString{
    NSString * str = [NSString stringWithFormat:@"%@年%s%@月%@",[self getYearStr:_year],(_leap ? "闰" : ""),self.chineseNumber[_month - 1],[self getChinaDayString:_day]];
    return str;
}

//把数字年份转换成中文年份。比如 1911 = 一九一一
-(NSString*)getYearStr:(NSInteger)year{
    NSArray * chineseword = @[@"零", @"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九"];
    NSInteger index = year / 1000;
    NSString * ys = chineseword[index];
    year = year % 1000;
    index = year / 100;
    ys = [ys stringByAppendingString:chineseword[index]];
    year = year % 100;
    index = year / 10;
    ys = [ys stringByAppendingString:chineseword[index]];
    year = year % 10;
    index = year;
    ys = [ys stringByAppendingString:chineseword[index]];
    return ys;
}
//这里主要是计算b八字
-(NSString*)getSixtyDay{
    NSString * temp = @"";
    for (int i = 0; i < 60; i++) {
        NSString * cycli = [NSString stringWithFormat:@",/%@/",[self cyclicalm:i]];
        temp = [temp stringByAppendingString:cycli];
    }
    return temp;
}
/**
 * @method
 * @brief 获取两个日期之间的天数
 * @param fromDate       起始日期
 * @param toDate         终止日期
 * @return    总天数
 */
- (NSInteger)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents    * comp = [calendar components:NSCalendarUnitDay
                                             fromDate:fromDate
                                               toDate:toDate
                                              options:NSCalendarWrapComponents];
    return comp.day;
}


/**
 * 彭祖
 * @param ri 日柱
 * @return ..
 */
-(NSString*)getPengZu:(NSString*)ri{
    NSArray  *array = [ri componentsSeparatedByString:@","];
    NSString * ganziday = array[2];//日柱
    NSString *last = [ganziday substringFromIndex:ganziday.length-1];
    NSString *last1 = [ganziday substringToIndex:1];
    
    int gani = 0;
    int zhii = 0;
    
    for (int i = 0; i < self.heavenly.count; i++) {
        if ([last1 isEqualToString:self.heavenly[i]]) {
            gani = i;
            break;
        }
    }
    
    for (int i = 0; i < self.earthlyBranch.count; i++) {
        if ([last isEqualToString:self.earthlyBranch[i]]) {
            zhii = i;
            break;
        }
    }
    NSString *p = [NSString stringWithFormat:@"%@,%@",self.pZuGan[gani],self.pZuZhi[zhii]];
    return p;
}
@end

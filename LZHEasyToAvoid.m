//
//  LZHEasyToAvoid.m
//  treasure
//
//  Created by 李占豪 on 2018/11/7.
//  Copyright © 2018 李占豪. All rights reserved.
//

#import "LZHEasyToAvoid.h"

@interface LZHEasyToAvoid ()

@property (nonatomic,strong) NSArray * data;
@property (nonatomic,strong) NSArray * shengxiao;

@end


@implementation LZHEasyToAvoid
/**
 * 月支日支    一月寅节    二月卯节    三月辰节    四月巳节    五月午节    六月未节    七月申节    八月酉节    九月戍节    十月亥节    十一子节    十二丑节 子    开    收    成
 * 危    破    执    定    平    满    除    建    闭 丑    闭    开    收    成    危    破    执    定    平    满    除    建 寅    建    闭    开    收    成    危    破    执    定    平    满    除 卯    除
 * 建    闭    开    收    成    危    破    执    定    平    满 辰    满    除    建    闭    开    收    成    危    破    执    定    平 巳    平    满    除    建    闭    开    收    成    危    破    执    定
 * 午    定    平    满    除    建    闭    开    收    成    危    破    执 未    执    定    平    满    除    建    闭    开    收    成    危    破 申    破    执    定    平    满    除    建    闭    开    收
 * 成    危 酉    危    破    执    定    平    满    除    建    闭    开    收    成 戍    成    危    破    执    定    平    满    除    建    闭    开    收 亥    收    成    危    破    执    定    平    满
 * 除    建    闭    开
 *
 *
 */
-(NSArray *)data{
    if (!_data) {
        _data = @[@[@"开",@"收",@"成",@"危",@"破",@"执",@"定",@"平",@"满",@"除",@"建",@"闭"],
                  @[@"闭",@"开",@"收",@"成",@"危",@"破",@"执",@"定",@"平",@"满",@"除",@"建"],
                  @[@"建",@"闭",@"开",@"收",@"成",@"危",@"破",@"执",@"定",@"平",@"满",@"除"],
                  @[@"除",@"建",@"闭",@"开",@"收",@"成",@"危",@"破",@"执",@"定",@"平",@"满"],
                  @[@"满",@"除",@"建",@"闭",@"开",@"收",@"成",@"危",@"破",@"执",@"定",@"平"],
                  @[@"平",@"满",@"除",@"建",@"闭",@"开",@"收",@"成",@"危",@"破",@"执",@"定"],
                  @[@"定",@"平",@"满",@"除",@"建",@"闭",@"开",@"收",@"成",@"危",@"破",@"执"],
                  @[@"执",@"定",@"平",@"满",@"除",@"建",@"闭",@"开",@"收",@"成",@"危",@"破"],
                  @[@"破",@"执",@"定",@"平",@"满",@"除",@"建",@"闭",@"开",@"收",@"成",@"危"],
                  @[@"危",@"破",@"执",@"定",@"平",@"满",@"除",@"建",@"闭",@"开",@"收",@"成"],
                  @[@"成",@"危",@"破",@"执",@"定",@"平",@"满",@"除",@"建",@"闭",@"开",@"收"],
                  @[@"收",@"成",@"危",@"破",@"执",@"定",@"平",@"满",@"除",@"建",@"闭",@"开"],];
    }
    return _data;
}

-(NSArray *)shengxiao{
    if (!_shengxiao) {
        _shengxiao = @[@"子",@"丑",@"寅",@"卯",@"辰",@"巳",@"午",@"未",@"申",@"酉",@"戌",@"亥"];
    }
    return _shengxiao;
}

-(NSString*)getshierjian:(NSInteger)month string:(NSString*)rizhi{
    if (month < 1 || month > 12) {
        return nil;
    }
    NSInteger riziindex = [self getarrayindex:self.shengxiao string:rizhi];
    return self.data[riziindex][month - 1];
}

-(NSInteger)getarrayindex:(NSArray*)array string:(NSString*)target{
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isEqualToString:target]) {
            return i;
        }
    }
    return -1;
}
/**
 *通胜十二建
 建、除、满、平、定、执、破、危、成、收、开、闭。 吉日：红白二事皆宜的日子。
 成日：成功、天帝纪万物成就的大吉日子，凡事皆顺。
 宜：结婚、开市、修造、动土、安床、破土、安葬、搬迁、    交易、求财、出行、立契、竖柱、裁种、牧养。  忌：诉讼。
 
 收日：收成、收获，天帝宝库收纳的日子。
  宜：祈福、求嗣、赴任、嫁娶、安床、修造、动土、    求学、开市、交易、买卖、立契。  忌：放债、新船下水、新车下地、破土、安葬。
 
 
 开日：开始、开展的日子。
  宜：祭祀、祈福、入学、上任、修造、动土、    开市、安床、交易、出行、竖柱。  忌：放债、诉讼、安葬。 次吉：吉日后，退而求其次的日子。
 
 建日：万物生育、强健、健壮的日子。
  
 宜：赴任、祈福、求嗣、破土、安葬、修造、上梁、求财、    置业、入学、考试、结婚、动土、签约、交涉、出行。
  忌：动土、开仓、掘井、乘船、新船下水、新车下地、维修水电器具。
 
 除日：扫除恶煞、去旧迎新的日子。
  宜：祭祀、祈福、婚姻、出行、入伙、搬迁、出货、动土、求医、交易。  忌：结婚、赴任、远行、签约。
 
 满日：丰收、美满、天帝宝库积满的日子。
  宜：嫁娶、祈福、移徙、开市、交易、求财、立契、祭祀、出行、牧养。  忌：造葬、赴任、求医。
 
 平日：普通的日子。
 
 平日：平常、官人集合平分的日子。
  宜：嫁娶、修造、破土、安葬、牧养、开市、安床、动土、求嗣。  忌：祈福、求嗣、赴任、嫁娶、开市、安葬。
 
 定日：安定、平常、天帝众客定座的日子。
  宜：祭祀、祈福、嫁娶、造屋、装修、修路、开市、入学、上任、入伙。  忌：诉讼、出行、交涉。
 
 
 凶日：诸事不宜，最好避之则吉，喜事更可免则免。
 执日：破日之从神，曰小耗，天帝执行万物赐天福，较差的日子。
 宜：造屋、装修、嫁娶、收购、立契、祭祀。  忌：开市、求财、出行、搬迁。
 
 
 * 破日：日月相冲，曰大耗，斗柄相冲相向必破坏的日子，大事不宜。
 * 宜：破土、拆卸、求医。
  忌：嫁娶、签约、交涉、出行、搬迁。
 
 危日：危机、危险，诸事不宜的日子。
 宜：祭祀、祈福、安床、拆卸、破土。  忌：登山、乘船、出行、嫁娶、造葬、迁徙。
 
 闭日：十二建中最后一日，关闭、收藏、天地阴阳闭寒的日子。  宜：祭祀、祈福、筑堤、埋池、埋穴、造葬、填补、修屋。  忌：开市、出行、求医、手术、嫁娶。
 * @param shierjianString 通胜十二建字符串
 */

-(void)shierxingjianpanduan:(NSString*)shierjianString{
    NSArray * jian1 = @[@"赴任",@"祈福",@"求嗣",@"破土",@"安葬",@"修造",@"上梁",@"求财"];
    NSArray * jian2 = @[@"动土",@"开仓",@"掘井",@"乘船",@"新船下水",@"新车下地",@"维修水电器具"];
    
    NSArray * chu1 = @[@"祭祀",@"祈福",@"婚姻",@"出行",@"入伙",@"搬迁",@"出货",@"动土",@"求医",@"交易"];
    NSArray * chu2 = @[@"结婚",@"赴任",@"远行",@"签约"];
    
    NSArray * man1 = @[@"嫁娶",@"祈福",@"移徙",@"开市",@"交易",@"求财",@"立契",@"祭祀",@"出行",@"牧养"];
    NSArray * man2 = @[@"造葬",@"赴任",@"求医"];
    
    NSArray * ping1 = @[@"嫁娶",@"修造",@"破土",@"安葬",@"牧养",@"开市",@"安床",@"动土",@"求嗣"];
    NSArray * ping2 = @[@"祈福",@"求嗣",@"赴任",@"嫁娶",@"开市",@"安葬"];
    
    NSArray * ding1 = @[@"祭祀",@"祈福",@"嫁娶",@"造屋",@"装修",@"修路",@"开市",@"入学",@"上任",@"入伙"];
    NSArray * ding2 = @[@"诉讼",@"出行",@"交涉"];
    
    NSArray * zhi1 = @[@"造屋",@"装修",@"嫁娶",@"收购",@"立契",@"祭祀"];
    NSArray * zhi2 = @[@"开市",@"求财",@"出行",@"搬迁"];
    
    NSArray * po1 = @[@"破土",@"拆卸",@"求医"];
    NSArray * po2 = @[@"嫁娶",@"签约",@"交涉",@"出行",@"搬迁"];
    
    NSArray * wei1 = @[@"祭祀",@"祈福",@"安床",@"拆卸",@"破土"];
    NSArray * wei2 = @[@"登山",@"乘船",@"出行",@"嫁娶",@"造葬",@"迁徙"];
    
    NSArray * cheng1 = @[@"结婚",@"开市",@"修造",@"动土",@"安床",@"破土",@"安葬",@"搬迁",@"交易",@"求财",@"出行",@"立契",@"竖柱",@"裁种",@"牧养"];
    NSArray * cheng2 = @[@"诉讼"];
    
    NSArray * shou1 = @[@"祈福",@"求嗣",@"赴任",@"嫁娶",@"安床",@"修造",@"动土",@"求学",@"开市",@"交易",@"买卖",@"立契"];
    NSArray * shou2 = @[@"放债",@"新船下水",@"新车下地",@"破土",@"安葬"];
    
    NSArray * kai1 = @[@"祭祀",@"祈福",@"入学",@"上任",@"修造",@"动土",@"开市",@"安床",@"交易",@"出行",@"竖柱"];
    NSArray * kai2 = @[@"放债",@"诉讼",@"安葬"];
    
    NSArray * bi1 = @[@"祭祀",@"祈福",@"筑堤",@"埋池",@"埋穴",@"造葬",@"填补",@"修屋"];
    NSArray * bi2 = @[@"开市",@"出行",@"求医",@"手术",@"嫁娶"];
    NSString * cand = @"";
    NSString * canot = @"";
    if ([shierjianString isEqualToString:@"建"]) {
        for (int i = 0; i < jian1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",jian1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < jian2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",jian2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"除"]) {
        for (int i = 0; i < chu1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",chu1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < chu2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",chu2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"满"]) {
        for (int i = 0; i < man1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",man1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < man2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",man2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"平"]) {
        for (int i = 0; i < ping1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",ping1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < ping2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",ping2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"定"]) {
        for (int i = 0; i < ding1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",ding1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < ding2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",ding2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"执"]) {
        for (int i = 0; i < zhi1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",zhi1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < zhi2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",zhi2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"破"]) {
        for (int i = 0; i < po1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",po1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < po2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",po2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"危"]) {
        for (int i = 0; i < wei1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",wei1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < wei2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",wei2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"成"]) {
        for (int i = 0; i < cheng1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",cheng1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < cheng2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",cheng2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"收"]) {
        for (int i = 0; i < shou1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",shou1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < shou2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",shou2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"开"]) {
        for (int i = 0; i < kai1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",kai1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < kai2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",kai2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    if ([shierjianString isEqualToString:@"闭"]) {
        for (int i = 0; i < bi1.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",bi1[i]];
            cand = [cand stringByAppendingString:b];
        }
        for (int i = 0; i < bi2.count; i++) {
            NSString * b = [NSString stringWithFormat:@" %@",bi2[i]];
            canot = [canot stringByAppendingString:b];
        }
    }
    _cando = cand;
    _canotdo = canot;
}

@end

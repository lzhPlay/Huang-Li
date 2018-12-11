//
//  LZHHuangLi.h
//  treasure
//
//  Created by 李占豪 on 2018/11/5.
//  Copyright © 2018 李占豪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZHHuangLi : NSObject
@property (nonatomic,assign) NSInteger year;
@property (nonatomic,assign) NSInteger month;
@property (nonatomic,assign) NSInteger day;
@property (nonatomic,assign) BOOL leap;
@property (nonatomic,strong) NSString * timer;
@property (nonatomic,strong) NSString * jBranch;


-(void)baZi:(NSString*)time;
-(NSString*)toString;
-(NSString*)getYearGanZhi:(int)hour;
-(NSString*)animalsYear;
-(NSString*)getPengZu:(NSString*)ri;
@end

NS_ASSUME_NONNULL_END

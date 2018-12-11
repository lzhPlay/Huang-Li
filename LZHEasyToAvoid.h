//
//  LZHEasyToAvoid.h
//  treasure
//
//  Created by 李占豪 on 2018/11/7.
//  Copyright © 2018 李占豪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZHEasyToAvoid : NSObject
@property (nonatomic,strong) NSString * cando;
@property (nonatomic,strong) NSString * canotdo;


-(NSString*)getshierjian:(NSInteger)month string:(NSString*)rizhi;
-(void)shierxingjianpanduan:(NSString*)shierjianString;
@end

NS_ASSUME_NONNULL_END

//
//  WJQNews.h
//  WJQNews
//
//  Created by 吴俊秋 on 2017/4/12.
//  Copyright © 2017年 JackWu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJQNews : NSObject

@property (nonatomic , strong) NSString *title;
@property (nonatomic , strong) NSArray *images;
@property (nonatomic , strong) NSString *source;
@property (nonatomic , strong) NSString *time;

/**
 重写init方法
 
 @param dic dic
 @return WJQNews
 */
-(instancetype)initWithDic:(NSDictionary *)dic;

@end

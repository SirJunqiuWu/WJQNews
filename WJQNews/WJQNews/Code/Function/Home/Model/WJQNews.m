//
//  WJQNews.m
//  WJQNews
//
//  Created by 吴俊秋 on 2017/4/12.
//  Copyright © 2017年 JackWu. All rights reserved.
//

#import "WJQNews.h"

@implementation WJQNews

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.title  = [dic getStringValueForKey:@"Title"];
        self.images = [dic getArrayValueForKey:@"ImagesList"];
        self.source = [dic getStringValueForKey:@"Source"];
        self.time   = [dic getStringValueForKey:@"PublishTime"];
    }
    return self;
}

@end

//
//  YcNetWorkImp.m
//  Yc_Code_test
//
//  Created by yu on 2017/8/11.
//  Copyright © 2017年 jett. All rights reserved.
//

#import "YcNetWorkImp.h"

@implementation YcNetWorkImp

static dispatch_once_t onceToken;
static YcNetWorkImp *sharedInstance;

+(YcNetWorkImp *)sharedInstance{
    dispatch_once(&onceToken, ^{
        sharedInstance = [[YcNetWorkImp alloc] init];
    });
    return sharedInstance;
}






@end

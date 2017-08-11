//
//  YcNetWork.m
//  Yc_Code_test
//
//  Created by yu on 2017/8/11.
//  Copyright © 2017年 jett. All rights reserved.
//

#import "YcNetWork.h"

@implementation YcNetWork

static dispatch_once_t onceToken;
static YcNetWork *sharedInstance;

+(YcNetWork *)sharedInstance{
    dispatch_once(&onceToken, ^{
        sharedInstance = [[YcNetWork alloc] init];
    });
    return sharedInstance;
}


-(void)requestWithGet:(NSString *)url Param:(NSDictionary *)dict Response:(HttpResponseBlock)block{
    
}

-(void)requestWithPost:(NSString *)url Param:(NSDictionary *)dict Response:(HttpResponseBlock)block Failed:(HttpFailedBlock)failedblock{
    
    
}

@end

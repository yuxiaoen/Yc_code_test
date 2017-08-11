//
//  YcNetWork.m
//  Yc_Code_test
//
//  Created by yu on 2017/8/11.
//  Copyright © 2017年 jett. All rights reserved.
//

#import "YcNetWork.h"
#import "YcNetWorkImp.h"

@implementation YcNetWork

static dispatch_once_t onceToken;
static YcNetWork *sharedInstance;

+(YcNetWork *)sharedInstance{
    dispatch_once(&onceToken, ^{
        sharedInstance = [[YcNetWork alloc] init];
    });
    return sharedInstance;
}


-(void)requestWithGet:(NSString *)url
            Parameter:(id)Parameter
             Response:(HttpResponseBlock)block
               Failed:(HttpFailedBlock)failedblock
{
    [YcNetWorkImp getWithUrlString:url Parameters:Parameter success:^(id responseObject){
        block(responseObject);
    } failure:^(NSError *error) {
        failedblock(error);
    }];
}

-(void)requestWithPost:(NSString *)url
             Parameter:(id)Parameter
              Response:(HttpResponseBlock)block
                Failed:(HttpFailedBlock)failedblock
{
    [YcNetWorkImp postWithUrlString:url Parameters:Parameter success:^(id responseObject) {
        block(responseObject);
    } failure:^(NSError *error) {
        failedblock(error);
    }];
    
}

@end

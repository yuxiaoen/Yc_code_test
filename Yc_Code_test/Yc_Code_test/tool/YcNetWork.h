//
//  YcNetWork.h
//  Yc_Code_test
//
//  Created by yu on 2017/8/11.
//  Copyright © 2017年 jett. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HttpResponseBlock)(id responseObj);
typedef void(^HttpFailedBlock)(NSError *error);


@interface YcNetWork : NSObject

+(YcNetWork *)sharedInstance;

-(void)requestWithGet:(NSString *)url Param:(NSDictionary *)dict Response:(HttpResponseBlock)block;

-(void)requestWithPost:(NSString *)url Param:(NSDictionary *)dict Response:(HttpResponseBlock)block Failed:(HttpFailedBlock)failedblock;

@end

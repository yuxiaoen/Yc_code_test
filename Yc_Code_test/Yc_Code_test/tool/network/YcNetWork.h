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

/**
 get请求

 @param url 请求地址
 @param Parameter 请求参数
 @param block 成功回调
 @param failedblock 失败回调
 */
-(void)requestWithGet:(NSString *)url
                Parameter:(id)Parameter
             Response:(HttpResponseBlock)block
               Failed:(HttpFailedBlock)failedblock;

/**
 post请求

 @param url 请求地址
 @param Parameter 请求参数
 @param block 成功回调
 @param failedblock 失败回调
 */
-(void)requestWithPost:(NSString *)url
                 Parameter:(id)Parameter
              Response:(HttpResponseBlock)block
                Failed:(HttpFailedBlock)failedblock;

@end

//
//  YcNetWorkImp.h
//  Yc_Code_test
//
//  Created by yu on 2017/8/11.
//  Copyright © 2017年 jett. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  request type
 */
typedef NS_ENUM(NSUInteger,HttpRequestType){
    
    //get
    HttpRequestTypeGet = 0,
    
    //post
    HttpRequestTypePost,
};


@interface YcNetWorkImp : NSObject

+(YcNetWorkImp *)sharedInstance;


/**
 网络请求:get

 @param urlstring 请求地址
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
+(void)getWithUrlString:(NSString *)urlstring
             Parameters:(id)parameters
                success:(void(^)(id responseObject))success
                failure:(void (^)(NSError *error))failure;



/**
 网络请求:post

 @param urlstring 请求地址
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
+(void)postWithUrlString:(NSString *)urlstring
              Parameters:(id)parameters
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSError *error))failure;


/**
 字典转成string

 @param params 请求参数
 @return 请求参数
 */
+(NSString *)stringWithParam:(NSDictionary *)params;


@end

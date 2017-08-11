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


+(void)getWithUrlString:(NSString *)urlstring
             Parameters:(id)parameters
                success:(void (^)(id))success
                failure:(void (^)(NSError *))failure
{
    NSString *param = [YcNetWorkImp stringWithParam:parameters];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",urlstring,param]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                failure(error);
            }else{
                id dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                success(dict);
            }
        });
    }];
    
    [sessionDataTask resume];
    
}

+(void)postWithUrlString:(NSString *)urlstring
              Parameters:(id)parameters
                 success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure
{
    NSString *param = [YcNetWorkImp stringWithParam:parameters];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlstring]];
    
    request.HTTPMethod = @"POST";
    
    
}


+(NSString *)stringWithParam:(NSDictionary *)params{
    NSString *paramString;
    NSMutableString *result = [NSMutableString new];
    NSMutableArray *array = [NSMutableArray new];
    
    NSEnumerator *keyEnum = [params keyEnumerator];
    id key;
    
    while (key = [keyEnum nextObject]) {
        paramString = [NSString stringWithFormat:@"%@=%@&",key,[params valueForKey:key]];
        [result appendString:paramString];
        [array addObject:paramString];
    }
    
    if (array > 0) {
        [result deleteCharactersInRange:NSMakeRange(result.length - 1, 1)];
    }
    
    return result;
}








@end

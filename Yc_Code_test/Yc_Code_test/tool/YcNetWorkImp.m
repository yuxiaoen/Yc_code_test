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
    
    
    
    
    
    
}

+(void)postWithUrlString:(NSString *)urlstring
              Parameters:(id)parameters
                 success:(void (^)(id))success
                 failure:(void (^)(NSError *))failure
{
    NSString *param = [YcNetWorkImp stringWithParam:parameters];
    
    
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

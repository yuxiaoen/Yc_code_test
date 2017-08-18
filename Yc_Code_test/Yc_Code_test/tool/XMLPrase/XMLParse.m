//
//  XMLParse.m
//  Yc_Code_test
//
//  Created by yu on 2017/8/15.
//  Copyright © 2017年 jett. All rights reserved.
//

#import "XMLParse.h"

@interface XMLParse()

@end

@implementation XMLParse

+(id)sharedInstance{
    static XMLParse *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[XMLParse alloc] init];
    });
    return sharedInstance;
}



@end

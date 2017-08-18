//
//  XMLParse.h
//  Yc_Code_test
//
//  Created by yu on 2017/8/15.
//  Copyright © 2017年 jett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParse : NSObject <NSXMLParserDelegate>

+(id)sharedInstance;

-(void)startParserXML;

@end

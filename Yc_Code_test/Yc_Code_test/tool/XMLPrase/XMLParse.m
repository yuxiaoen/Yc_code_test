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

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


-(void)parserDidStartDocument:(NSXMLParser *)parser{
    //开始解析
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    //解析节点，解析参数
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    //节点值
    
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    //节点分析完毕
    
}


-(void)parserDidEndDocument:(NSXMLParser *)parser{
    //解析完毕
    
}


@end

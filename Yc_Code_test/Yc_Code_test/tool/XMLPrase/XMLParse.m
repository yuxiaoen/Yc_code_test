//
//  XMLParse.m
//  Yc_Code_test
//
//  Created by yu on 2017/8/15.
//  Copyright © 2017年 jett. All rights reserved.
//

#import "XMLParse.h"

@interface XMLParse()

@property (nonatomic, strong) NSString *moduleName;

@property (nonatomic, strong) NSMutableDictionary *eventDict;

@property (nonatomic, strong) NSMutableDictionary *argDic;

@property (nonatomic, strong) NSMutableDictionary *tempDic;

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
        self.eventDict = [[NSMutableDictionary alloc] init];
        self.argDic = [[NSMutableDictionary alloc] init];
        self.tempDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}


-(void)startParserXML{
    NSString *xmlPath = [[NSBundle mainBundle] pathForResource:@"xml_test" ofType:@"xml"];
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:xmlPath];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    xmlParser.delegate = self;
    
    [xmlParser parse];
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

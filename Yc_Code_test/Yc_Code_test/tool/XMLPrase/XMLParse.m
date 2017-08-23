//
//  XMLParse.m
//  Yc_Code_test
//
//  Created by yu on 2017/8/15.
//  Copyright © 2017年 jett. All rights reserved.
//

#import "XMLParse.h"
#import "ModuleDefine.h"

@interface XMLParse()

@property (nonatomic, strong) NSString *moduleName;

@property (nonatomic, strong) NSMutableDictionary *eventDict;

@property (nonatomic, strong) NSMutableDictionary *argDic;

@property (nonatomic, strong) NSMutableDictionary *tempDic;

@property (nonatomic, strong) NSString *tempName;

@property (nonatomic, strong) NSString *arg_value;

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
    _tempName = elementName;
    if ([elementName isEqualToString:ELEMENT_NAME_MODULE]) {
        _moduleName = [attributeDict valueForKey:@"name"];
        
    }
    
    
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    //节点值
    _arg_value = string;
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    //节点分析完毕
    if ([elementName isEqualToString:_tempName]) {
        if ([elementName isEqualToString:ELEMENT_ATTRIBUTE_TYPE1]) {
            [_eventDict setValue:_arg_value forKey:ELEMENT_ATTRIBUTE_TYPE1];
        }else if([elementName isEqualToString:ELEMENT_ATTRIBUTE_TYPE2]){
            [_eventDict setValue:_arg_value forKey:ELEMENT_ATTRIBUTE_TYPE2];
        }else if ([elementName isEqualToString:ELEMENT_ATTRIBUTE_TYPE3]){
            [_eventDict setValue:_arg_value forKey:ELEMENT_ATTRIBUTE_TYPE3];
        }else if ([elementName isEqualToString:ELEMENT_ATTRIBUTE_ARG_ID]){
            [_argDic setValue:_arg_value forKey:ELEMENT_ATTRIBUTE_ARG_ID];
        }else if ([elementName isEqualToString:ELEMENT_ATTRIBUTE_ARG_URL]){
            [_argDic setValue:_arg_value forKey:ELEMENT_ATTRIBUTE_ARG_URL];
        }else if ([elementName isEqualToString:ELEMENT_ATTRIBUTE_APPKEY]){
            [_argDic setValue:_arg_value forKey:ELEMENT_ATTRIBUTE_APPKEY];
        }
    }
    
    if ([elementName isEqualToString:ELEMENT_NAME_MODULE]) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setValue:[_argDic copy] forKey:ELEMENT_NAME_ARGUMENTS];
        [dict setValue:[_eventDict copy] forKey:ELEMENT_NAME_EVENTS];
        [dict setValue:_moduleName forKey:ELEMENT_NAME_MODULE];
        
        

    }
}


-(void)parserDidEndDocument:(NSXMLParser *)parser{
    //解析完毕

}


@end

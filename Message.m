//
//  Message.m
//  TableTest
//
//  Created by Jc on 15/9/1.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import "Message.h"

#define NEW_MESSAGE(_user,_content) [[Message alloc]init:_user initContent:_content]

@implementation Message

@synthesize user;
@synthesize content;

- (id) init:(User *)_user initContent:(NSString *)_content
{
    self = [super init];
    self.user = _user;
    self.content = _content;
    
    return self;
}

/*
 * 获取假数据
 */
- (NSMutableArray *)messages
{
    NSMutableArray *messageArray = [[NSMutableArray alloc]init];
    
    NSMutableArray *userArray = [[User alloc]init].users;
    for (int i = 0; i < userArray.count; i++) {
        NSString *tempMessage = [NSString stringWithFormat:@"%@ sya aaaaaa....",[userArray[i] name]];
        [messageArray addObject:NEW_MESSAGE(userArray[i],tempMessage)];
    }
    
    return messageArray;
}
@end

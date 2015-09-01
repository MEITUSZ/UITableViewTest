//
//  User.m
//  TableTest
//
//  Created by Jc on 15/8/31.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import "User.h"

#define NEW_USER(str) [[User alloc]init:str]

@implementation User

@synthesize name;

- (id) init:(NSString *)_name
{
    self = [super init];
    self.name = _name;
    self.avatarUrl = [NSURL URLWithString:@"http://cdn-img.easyicon.net/png/11921/1192102.gif"];
    return self;
}

- (NSMutableArray *)users
{
    NSMutableArray *usersArray = [[NSMutableArray alloc]init];
    
    [usersArray addObject:NEW_USER(@"Jack")];
    [usersArray addObject:NEW_USER(@"Andrew")];
    [usersArray addObject:NEW_USER(@"Tomic")];
    [usersArray addObject:NEW_USER(@"Anny")];
    [usersArray addObject:NEW_USER(@"嘿嘿")];
    [usersArray addObject:NEW_USER(@"..22##$#@(@hah")];
    [usersArray addObject:NEW_USER(@"BatMan")];
    [usersArray addObject:NEW_USER(@"Bob")];
    [usersArray addObject:NEW_USER(@"Anny")];
    [usersArray addObject:NEW_USER(@"Zoe")];

    
    return usersArray;
}
@end

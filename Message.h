//
//  Message.h
//  TableTest
//
//  Created by Jc on 15/9/1.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Message : NSObject

@property (nonatomic,strong)User *user;

@property (nonatomic,strong)NSString *content;
@property (nonatomic) NSDate* time;


- (NSMutableArray *)messages;
@end

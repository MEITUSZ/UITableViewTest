//
//  User.h
//  TableTest
//
//  Created by Jc on 15/8/31.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (readwrite,nonatomic) NSString *name;
@property (nonatomic) NSURL *avatarUrl;

- (id)init:(NSString *) name;

- (NSMutableArray *)users;

@end

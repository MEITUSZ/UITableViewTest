//
//  User.m
//  TableTest
//
//  Created by Jc on 15/8/31.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize name;

- (id) init:(NSString *)_name
{
    self = [super init];
    self.name = _name;
    return self;
}
@end

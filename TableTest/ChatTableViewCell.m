//
//  ChatTableViewCell.m
//  TableTest
//
//  Created by Jc on 15/9/1.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import "ChatTableViewCell.h"

@implementation ChatTableViewCell

@synthesize name = _name;
@synthesize time = _time;
@synthesize content = _content;
@synthesize avatar = _avatar;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMessageObject:(Message *)message
{
    _name.text = message.user.name;
    _content.text = message.content;
    
    ImageDownLoadHelper *imageDownLoadHelper = [[ImageDownLoadHelper alloc]init];
    imageDownLoadHelper.delegate = self;
    [imageDownLoadHelper startImageDownLoad:message.user.avatarUrl];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *formatterTime = [dateFormatter stringFromDate:[NSDate date]];
    _time.text = formatterTime;
}

- (void)imageDidLoad: (UIImage *)_image
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"load iamge success");
        _avatar.image = _image;
    });
}

@end

//
//  ChatTableViewCell.h
//  TableTest
//
//  Created by Jc on 15/9/1.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "ImageDownLoadHelper.h"

@interface ChatTableViewCell : UITableViewCell <ImageDownLoadHelperDelegate>

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

- (void)setMessageObject : (Message *)_message;
@end

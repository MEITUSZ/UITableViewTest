//
//  ImageDownLoadHelper.h
//  TableTest
//
//  Created by Jc on 15/9/1.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageDownLoadHelperDelegate

@required
- (void)imageDidLoad: (UIImage *)_image;
@end



@interface ImageDownLoadHelper : NSObject

@property (nonatomic,strong) id<ImageDownLoadHelperDelegate> delegate;

- (void) startImageDownLoad: (NSURL *)_imageURL;

@end

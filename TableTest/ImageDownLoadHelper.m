//
//  ImageDownLoadHelper.m
//  TableTest
//
//  Created by Jc on 15/9/1.
//  Copyright (c) 2015年 Jc. All rights reserved.
//

#import "ImageDownLoadHelper.h"

@implementation ImageDownLoadHelper

- (void) startImageDownLoad: (NSURL *)_imageURL
{
    if (_imageURL) {
        
        NSURLRequest *request = [NSURLRequest requestWithURL:_imageURL];
        NSURLSessionConfiguration *conf = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:(request ) completionHandler:^(NSURL *localfile, NSURLResponse *response, NSError *error) {
            //子线程队列
            if (!error) {
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:localfile]];
                
                //[self performSelectorOnMainThread:@selector(dealImage:) withObject:image waitUntilDone:NO];
                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    
//                });
                [_delegate imageDidLoad:image];
            }
            
        }];
        [task resume];
    }
}


@end

//
//  UIImageView+Extensions.m
//  HosApp
//
//  Created by s1614 on 15/10/15.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "UIImageView+Extensions.h"
//#import "ASIDownloadCache+ExtesionCache.h"

@implementation UIImageView (Extensions)
+ (CGRect)imageViewFrame:(CGRect)imageViewFrame superViewSize:(CGSize)superViewSize{
    float x = (superViewSize.width - imageViewFrame.size.width)/2;
    float y = (superViewSize.height - imageViewFrame.size.height)/2;
    float left = x;
    float top  = y;
    float width = imageViewFrame.size.width;
    float height = imageViewFrame.size.height;
    float screen_width;
    float screen_height;
    
    screen_width = superViewSize.width;
    screen_height = superViewSize.height;
    float view_scale = imageViewFrame.size.width / imageViewFrame.size.height;
    float screen_scale = screen_width / screen_height;
    
    // 如果当前图像比例小于视频图像比例，则使用缩放高度， 宽度按比例view_scale 缩放
    if(view_scale < screen_scale) {
        height = screen_height;
        width = (int)(height*view_scale);
        top = 0;
        left = (screen_width - width)/2;
    } else {
        width = screen_width;
        height = (int)(width/view_scale);
        left = 0;
        top = (screen_height - height)/2;
    }
    NSLog(@"final rect ==============%@",NSStringFromCGRect(CGRectMake(left, top, width, height)));
    return CGRectMake(left, top, width, height);
}
@end




@implementation UIImageView (AsyncImage)
- (void)setImage:(UIImage *)image reqesutFromURL:(NSString *)urlString failedImage:(UIImage *)failImage
{
//    if (image) {
//        [self setImage:image];
//    }else
//    {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            UIImage *reqesutImage = nil;
//            NSURL *url = [NSURL URLWithString:urlString];
//            NSData *cacheDate = [[ASIDownloadCache sharedCache] dateInCacheForUrl:url];
//            if (cacheDate) {
//                reqesutImage = [UIImage imageWithData:cacheDate];
//            }else
//            {
//                ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url usingCache:[ASIDownloadCache sharedCache]];
//                [request startSynchronous];
//                reqesutImage = [UIImage imageWithData:request.responseData];
//            }
//            if (reqesutImage) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self setImage:reqesutImage];
//                });
//            }
//            else {
//                if (failImage) {
//                    [self setImage:failImage];
//                }
//                
//                NSLog(@"async load error.");
//            }
//        });
//        
//    }
    
}
@end


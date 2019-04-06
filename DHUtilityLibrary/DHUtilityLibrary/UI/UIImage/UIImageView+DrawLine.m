//
//  UIView+DrawLine.m
//  HosApp
//
//  Created by HSH-D-2213 on 14-5-8.
//  Copyright (c) 2014年 NetEase. All rights reserved.
//

#import "UIImageView+DrawLine.h"
#import "ASIDownloadCache+ExtesionCache.h"

@implementation UIImageView(DrawLine)

- (void) drawLinefrom:(CGPoint)fPoint to:(CGPoint)tPoint{
    
    UIGraphicsBeginImageContext(self.frame.size);
    
    [self.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapButt);
    
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 1.0f);
    
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), NO);
    
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1, 1, 1, 1.0);
    
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), fPoint.x, fPoint.y);
    
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), tPoint.x, tPoint.y);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    self.image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
}

@end

@implementation UIImageView (AsyncImage)
- (void)setImage:(UIImage *)image reqesutFromURL:(NSString *)urlString failedImage:(UIImage *)failImage
{
    if (image) {
        [self setImage:image];
    }else
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *reqesutImage = nil;
            NSURL *url = [NSURL URLWithString:urlString];
            NSData *cacheDate = [[ASIDownloadCache sharedCache] dateInCacheForUrl:url];
            if (cacheDate) {
                reqesutImage = [UIImage imageWithData:cacheDate];
            }else
            {
                ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url usingCache:[ASIDownloadCache sharedCache]];
                [request startSynchronous];
                reqesutImage = [UIImage imageWithData:request.responseData];
            }
            if (reqesutImage) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self setImage:reqesutImage];
                });
            }
            else {
                if (failImage) {
                    [self setImage:failImage];
                }
                
                NSLog(@"async load error.");
            }
        });
        
    }
    
}

@end


//
//  UIView+DrawLine.h
//  HosApp
//
//  Created by HSH-D-2213 on 14-5-8.
//  Copyright (c) 2014年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ASIHTTPRequest.h>
#import <ASIDownloadCache.h>
@interface UIImageView (DrawLine)
- (void) drawLinefrom:(CGPoint)fPoint to:(CGPoint)tPoint;
@end

@interface UIImageView (AsyncImage)
- (void)setImage:(UIImage *)image reqesutFromURL:(NSString *)urlString failedImage:(UIImage *)failImage;

@end

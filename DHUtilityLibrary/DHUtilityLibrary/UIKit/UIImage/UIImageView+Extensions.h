//
//  UIImageView+Extensions.h
//  HosApp
//
//  Created by s1614 on 15/10/15.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extensions)
+ (CGRect)imageViewFrame:(CGRect)imageViewFrame superViewSize:(CGSize)superViewSize;
@end



@interface UIImageView (AsyncImage)
- (void)setImage:(UIImage *)image reqesutFromURL:(NSString *)urlString failedImage:(UIImage *)failImage;

@end

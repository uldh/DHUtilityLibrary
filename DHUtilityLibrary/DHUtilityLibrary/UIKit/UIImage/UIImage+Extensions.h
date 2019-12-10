//
//  UIImage+Extensions.h
//  OCR
//
//  Created by ren6 on 2/14/13.
//  Copyright (c) 2013 ren6. All rights reserved.
//

//
//  UIImage-Extensions.h
//
//  Created by Hardy Macia on 7/1/09.
//  Copyright 2009 Catamount Software. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface UIImage (Extensions)
+ (UIImage *)circelImage:(UIImage *)image withParam:(CGFloat)inset;
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)circelImageWithParam:(CGFloat)inset;
- (UIImage *)orientationUpImage;
//- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
//- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

- (UIImage *)compressToSize:(CGSize )size quality:(CGFloat)quality;
- (UIImage *)imageBlackToTransparent:(UIImage*) image;
- (NSData *)compressToSize:(CGSize )size scale:(CGFloat)scale maxBite:(long)bit quality:(CGFloat)compressionQuality;
- (UIImage *)grayImage;
- (UIImage *)scaleImageToScale:(float)scaleSize;

//图片合成
+ (UIImage *)mergeImageFont:(UIImage *)imageFont withImageBack:(UIImage *)imageBack;
@end;

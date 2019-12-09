//
//  GIF.m
//  DHUtilityLibrary
//
//  Created by ldh on 2019/10/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "GIF.h"

@implementation GIF
- (void)showGifByWebview {
    #pragma clang diagnostic ignored "-Wnonnull"
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dancer" ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake(60, 90, 100, 75)];
    webview.scalesPageToFit = YES;
    [webview loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    webview.opaque = NO;
//    [self.view addSubview:webview];
}
- (void)showGifByImageView {
    NSURL *gifUrl = [[NSBundle mainBundle] URLForResource:@"dancer" withExtension:@"gif"];
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL((CFURLRef)gifUrl, NULL);
    size_t imageCount = CGImageSourceGetCount(gifSource);
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    UIImage * imageStatic;
    for (size_t i = 0; i < imageCount; i++) {
        //获取源图片
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(gifSource, i, NULL);
        UIImage *image = [UIImage imageWithCGImage:imageRef];
        [mutableArray addObject:image];
        CGImageRelease(imageRef);
        
        //设置动画停下后显示的静止图
        if (i == imageCount- 1) {
          imageStatic = image;
        }
    }
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 185, 100, 75)];
    imageView.image = imageStatic;
    imageView.animationImages = mutableArray;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.animationDuration = 0.5;
    imageView.animationRepeatCount = 0;//为0时无限播放
    [imageView startAnimating];
//    [self.view addSubview:imageView];
}
@end

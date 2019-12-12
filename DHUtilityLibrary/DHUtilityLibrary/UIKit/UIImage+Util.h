//
//  UIImage+Util.h
//  app
//
//  Created by ldh on 2019/12/12.
//  Copyright © 2019 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Util)
// 颜色转换成UIImage类型.
+ (UIImage *)imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END

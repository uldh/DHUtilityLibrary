//
//  NSString+NETextSize.h
//  HosApp
//
//  Created by s1614 on 14/12/8.
//  Copyright (c) 2014年 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (NETextSize)
+ (CGSize)sizeOfString:(NSString *)text font:(UIFont *)font sizeConstrained:(CGSize)size;
+ (CGSize)sizeLabelWidth:(CGFloat)width
          attributedText:(NSAttributedString *)attributted;

@end

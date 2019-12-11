//
//  NSString+NETextSize.m
//  HosApp
//
//  Created by s1614 on 14/12/8.
//  Copyright (c) 2014年 NetEase. All rights reserved.
//

#import "NSString+NETextSize.h"

@implementation NSString (NETextSize)
+ (CGSize)sizeOfString:(NSString *)text font:(UIFont *)font sizeConstrained:(CGSize)size{
    CGSize sizeOfString;
    UIFont * fontLocal = font;
    if (!fontLocal) {
        fontLocal = [UIFont systemFontOfSize:12];
    }
    NSString * textLocal = text;
    if (!textLocal) {
        textLocal = @"";
    }
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        sizeOfString = [textLocal boundingRectWithSize:size options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:fontLocal} context:nil].size;
    }else {
        sizeOfString = [textLocal sizeWithFont:fontLocal constrainedToSize:size];
    }
    return sizeOfString;
}

+ (CGSize)sizeLabelWidth:(CGFloat)width
          attributedText:(NSAttributedString *)attributted
{
    if(width<=0){
        return CGSizeZero;
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 3000)];
    lab.attributedText = attributted;
    lab.numberOfLines = 0;
    
    CGSize labSize = [lab sizeThatFits:lab.bounds.size];
    return labSize;
}

@end

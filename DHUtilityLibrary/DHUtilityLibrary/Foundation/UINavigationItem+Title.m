//
//  UINavigationItem+Title.m
//  app
//
//  Created by ldh on 2019/12/12.
//  Copyright © 2019 Netease. All rights reserved.
//

#import "UINavigationItem+Title.h"
#import "NSString+NETextSize.h"


@implementation UINavigationItem (Title)

- (void)customTitle:(NSString *)title {
    if(!self.titleView || ![self.titleView isKindOfClass:[UILabel class]]) {
        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar_common_pic_bg"]];
        bgImageView.tag = 1;
        UILabel *navigationTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        navigationTitle.textColor = [UIColor whiteColor];
        navigationTitle.backgroundColor = [UIColor clearColor];
//        navigationTitle.shadowOffset = CGSizeMake(1, 1);
//        navigationTitle.shadowColor = [UIColor whiteColor];
        navigationTitle.textAlignment = NSTextAlignmentCenter;
        navigationTitle.font = [UIFont systemFontOfSize:17];
        self.titleView = navigationTitle;//[[UIView alloc] initWithFrame:bgImageView.bounds];
    }
    UILabel*navigationTitle = (UILabel*)self.titleView;

    if (navigationTitle && [navigationTitle isKindOfClass:[UILabel class]]) {
        navigationTitle.text = title;
    }
//    CGSize sizeOfText = [NSString sizeOfString:navigationTitle.text font:navigationTitle.font sizeConstrained:CGSizeMake(SCREEN_WIDTH - 120, 44)];
    
    navigationTitle.bounds = CGRectMake(0, 0, 150, 44);
    self.titleView.bounds = navigationTitle.bounds;
}
@end

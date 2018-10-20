//
//  UIView+EqualGap.h
//  DHUtilityLibrary
//
//  Created by apple on 2018/10/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EqualGap)
- (void) distributeSpacingHorizontallyWith:(NSArray*)views;//等间距分布 views，由父 view 调用
- (void) distributeSpacingVerticallyWith:(NSArray*)views;
@end

NS_ASSUME_NONNULL_END

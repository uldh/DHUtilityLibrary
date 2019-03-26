//
//  ScrollTextView.h
//  SubViews
//
//  Created by ldh on 2019/3/15.
//  Copyright © 2019 ldh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface ScrollTextItem : NSObject
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *urlImageIcon;
@end

@interface ScrollTextView : UIView
- (instancetype)initWithFrame:(CGRect)frame;
- (void)inputData:(NSArray <ScrollTextItem *>*)items;
@end

@interface SingleTextView : UIView
- (void)loadImage:(NSString *)imageIconURL title:(NSString *)title;
@end
NS_ASSUME_NONNULL_END

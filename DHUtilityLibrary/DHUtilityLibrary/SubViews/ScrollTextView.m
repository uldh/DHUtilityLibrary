//
//  ScrollTextView.m
//  SubViews
//
//  Created by ldh on 2019/3/15.
//  Copyright © 2019 ldh. All rights reserved.
//

#import "ScrollTextView.h"
#define SingleTextViewHeight               30
#define Speed                   3
@interface ScrollTextView ()
@property (strong, nonatomic) NSMutableArray <ScrollTextItem *>*data;
@property (strong, nonatomic) NSTimer *timerMain;
@end

@implementation ScrollTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
- (void)inputData:(NSArray <ScrollTextItem *>*)items{
    self.clipsToBounds = YES;
    [self removeAllSubviews];
    self.data = [[NSMutableArray alloc]init];
    [self.data addObjectsFromArray:items];
    if(!self.timerMain){
        self.timerMain = [NSTimer timerWithTimeInterval:Speed+0.2 target:self selector:@selector(inputOneBullet) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timerMain forMode:NSRunLoopCommonModes];
    }
}
- (void)inputOneBullet{
    if (self.data.count == 0) {
        return;
    }
    SingleTextView * singleTextView = [self creatSingleTextViewBy:self.data.firstObject];
    [self fireBullet:singleTextView];
    ScrollTextItem * scrollTextItemTemp = self.data.firstObject;
    [self.data removeObject:scrollTextItemTemp];
    [self.data addObject:scrollTextItemTemp];
}
- (SingleTextView *)creatSingleTextViewBy:(ScrollTextItem *)item{
    SingleTextView * singleTextView = [[SingleTextView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, SingleTextViewHeight)];
    [singleTextView loadImage:item.urlImageIcon title:item.title];
    return singleTextView;
}
- (void)fireBullet:(SingleTextView*)bullet{
    [self addSubview:bullet];
    bullet.frame = CGRectMake(0, self.frame.size.height, bullet.frame.size.width, bullet.frame.size.height);
    [UIView animateWithDuration:Speed/3.0 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^{
        bullet.frame = CGRectMake(0, 0, bullet.frame.size.width, bullet.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:Speed/3.0 delay:Speed/3.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                bullet.frame = CGRectMake(0, -bullet.frame.size.height, bullet.frame.size.width, bullet.frame.size.height);
            } completion:^(BOOL finished) {
                if (finished) {
                    [self discardBullet:bullet];
                }
            }];
        }
    }];
}
- (void)discardBullet:(SingleTextView*)bullet{
//    NSLog(@"丢弃弹壳");
    [bullet removeFromSuperview];
}
@end


@interface SingleTextView ()
@property (strong, nonatomic) UIImageView *imageViewIcon;
@property (strong, nonatomic) UILabel *labelTitle;
@end

@implementation SingleTextView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}
- (void)loadImage:(NSString *)imageIconURL title:(NSString *)title{
//    self.imageViewIcon.image = imageIcon;
    [self.imageViewIcon sd_setImageWithURL:[NSURL URLWithString:imageIconURL] placeholderImage:nil];
    self.labelTitle.text = title;
}
- (UIImageView *)imageViewIcon{
    if (!_imageViewIcon) {
        _imageViewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, SingleTextViewHeight, SingleTextViewHeight)];
//        [Helper setcornerRadiusWithView:_imageViewIcon radius:_imageViewIcon.height*0.5];
        [self addSubview:_imageViewIcon];
    }
    return _imageViewIcon;
}
- (UILabel *)labelTitle{
    if (!_labelTitle) {
        CGFloat xLabel = self.imageViewIcon.frame.origin.x+self.imageViewIcon.frame.size.width + 12;
        _labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(xLabel, 0, self.frame.size.width - xLabel, SingleTextViewHeight)];
        _labelTitle.font = [UIFont systemFontOfSize:12];
        [self addSubview:_labelTitle];
    }
    return _labelTitle;
}
@end


@implementation ScrollTextItem


@end

//
//  WebExplorViewController.h
//  app
//
//  Created by ldh on 2019/10/22.
//  Copyright © 2019 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,WebViewType){
    WebViewTypeNoRightButton   = 1<<0,
    WebViewTypeWithShareButton = 1<<1,
    WebViewTypeWithCloseButton = 1<<2,
    WebViewTypeWithCollectionButton = 1<<3
};

@interface WebExplorViewController : UIViewController
@property (nonatomic,strong)WKWebView *webView;
@property (nonatomic,strong)UIProgressView *progressView;
@property (nonatomic, copy)NSString* webViewUrl;
@property (nonatomic, copy)NSString* webViewTitle;
@property (assign, nonatomic) BOOL isEULA;
@property (assign, nonatomic)WebViewType type;

- (id)initWithUrlString:(NSString *)webViewUrl title:(NSString *)title;
- (id)initWithUrlString:(NSString *)webViewUrl title:(NSString *)title type:(WebViewType)type;



@end

NS_ASSUME_NONNULL_END

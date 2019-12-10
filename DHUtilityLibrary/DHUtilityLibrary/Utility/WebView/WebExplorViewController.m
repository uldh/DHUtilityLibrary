//
//  WebExplorViewController.m
//  app
//
//  Created by ldh on 2019/10/22.
//  Copyright © 2019 Netease. All rights reserved.
//

#import "WebExplorViewController.h"
#define SCREEN_WIDTH                ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT               ([UIScreen mainScreen].bounds.size.height)

@interface WebExplorViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>

@end

@implementation WebExplorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self loadWebView];
}

- (void)dealloc {
    [self releaseWebView];
}
- (void)releaseWebView{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress" context:nil];
}

- (id)initWithUrlString:(NSString *)webViewUrl title:(NSString *)title {
    return [self initWithUrlString:webViewUrl title:title type:WebViewTypeNoRightButton];
}
- (id)initWithUrlString:(NSString *)webViewUrl title:(NSString *)title type:(WebViewType)type{
    self = [super init];
    if (self) {
        self.webViewUrl = webViewUrl;
        self.webViewTitle = title;
        self.type = type;
    }
    return self;
}
- (void)loadWebView{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.webViewUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:600];
    [self.webView loadRequest:request];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([keyPath isEqualToString:@"estimatedProgress"]){
        self.progressView.hidden=(self.webView.estimatedProgress== 1);
        if (self.webView.estimatedProgress == 1) {
            
        }
        [self.progressView setProgress:(self.webView.estimatedProgress) animated:YES];
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [_progressView setProgress:0.0 animated:NO];

}

- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        if ([challenge previousFailureCount] == 0) {
            NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
        } else {
            completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
        }
    } else {
        completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, nil);
    }
    NSLog(@"protectionSpace = %@",challenge.protectionSpace);

}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    //    webView
    NSLog(@"在收到响应后，决定是否跳转 %@ %@",NSStringFromSelector(_cmd),webView.URL.absoluteString);
    decisionHandler(WKNavigationResponsePolicyAllow);
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
}


- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
//    [self createNew]
    WKFrameInfo *frameInfo = navigationAction.targetFrame;
    if (![frameInfo isMainFrame]) {
        [webView loadRequest:navigationAction.request];
    }

    return nil;
}
#pragma mark - delegate
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    //js
}
#pragma mark getter
- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 66, SCREEN_WIDTH, 2)];
        _progressView.trackTintColor = [UIColor clearColor];
        _progressView.progressTintColor = [UIColor blueColor];
        _progressView.progress =0;
        [self.view addSubview:_progressView];
    }
    return _progressView;
}
- (WKWebView *)webView{
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        WKUserContentController *userController = [[WKUserContentController alloc] init];
        configuration.userContentController = userController;
        if (@available(iOS 10.0, *)) {
            configuration.dataDetectorTypes = UIDataDetectorTypeNone;
        }
        
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) configuration:configuration];
//        [userController addScriptMessageHandler:self name:JS_SHOW_MORE_COMMENT_WK];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        [_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
        
        _webView.backgroundColor = [UIColor clearColor];
        _webView.scrollView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.bottom.offset(0);
            if (self.mas_topLayoutGuide) {
                make.top.equalTo(self.mas_topLayoutGuide);
            }else{
                make.top.offset(64+20);
            }
        }];
    }
    return _webView;
}
@end

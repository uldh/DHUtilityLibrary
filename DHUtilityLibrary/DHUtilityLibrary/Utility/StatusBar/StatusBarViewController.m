//
//  StatusBarViewController.m
//  DHUtilityLibrary
//
//  Created by ldh on 2019/12/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import "StatusBarViewController.h"

@interface StatusBarViewController ()

@end

@implementation StatusBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor cyanColor]];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //在将要显现页面时进行，颜色设置
    [self setStatusBarBackgroundColor:[UIColor redColor]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    //在页面将要离开事对设置颜色进行置空恢复原来的颜色，或者clearColor 在此之前打印其背景颜色你会发现是空的。
    [self setStatusBarBackgroundColor:NULL];
}
//设置文字颜色，只有黑白
 - (UIStatusBarStyle)preferredStatusBarStyle {//当 UIViewController 在 UINavigationController 导航栏中时，上面方法没用， preferredStatusBarStyle 方法根本不会被调用，因为 UINavigationController 中也有 preferredStatusBarStyle 这个方法
     return UIStatusBarStyleLightContent;
 }

//设置状态栏背景颜色，颜色任意
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        UIView *_customStatusBar = nil;
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        for (UIView *subView in keyWindow.subviews) {
            if (subView.tag == 109090909) {
                _customStatusBar = subView;
            }
        }
        
        if (color) {//有颜色
            if (_customStatusBar) {//已经有自定义的StatusBar，那就直接设置颜色
                _customStatusBar.backgroundColor = color;
            } else {//没有那就添加一个，并且设置颜色
                UIView *statusBar = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame] ;
                statusBar.backgroundColor = color;
                statusBar.tag = 109090909;
                [[UIApplication sharedApplication].keyWindow addSubview:statusBar];
            }
        } else {//没有颜色
            if (_customStatusBar) {//已经有自定义的StatusBar，那就设置成透明色
                _customStatusBar.backgroundColor = [UIColor clearColor];
            } else {//没有就不用管了
                
            }
        }

    } else {
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
        if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
            statusBar.backgroundColor = color;
        }
    }
}
@end

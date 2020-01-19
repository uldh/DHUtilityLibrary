//
//  MacroUtilities.h
//  DHUtilityLibrary
//
//  Created by apple on 2018/10/27.
//  Copyright © 2018 apple. All rights reserved.
//

#ifndef MacroUtilities_h
#define MacroUtilities_h
//文件路径
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


#define APP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define RGB(A, B, C)        [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]

#define UI_NAVIGATION_BAR_HEIGHT    44
#define UI_TAB_BAR_HEIGHT           49
#define UI_STATUS_BAR_HEIGHT        20

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define NSBundle_View(nibname,index) [[[NSBundle mainBundle] loadNibNamed:nibname owner:nil options:nil] objectAtIndex:index];

#define IPHONE_X_And_Above \
({BOOL isPhoneXAndAbove = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneXAndAbove = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneXAndAbove);})

//有 safeArea 判定为异形屏
#define isAbnormalScreen ({\
int tmp = 0;\
if (@available(iOS 11.0, *)) {\
    if (!UIEdgeInsetsEqualToEdgeInsets([UIApplication sharedApplication].delegate.window.safeAreaInsets, UIEdgeInsetsZero)) {\
        tmp = 1;\
    }else{\
        tmp = 0;\
    }\
}else{\
    tmp = 0;\
}\
    tmp;\
})

#define GoldenSection           0.618


#define Flexible(x) (MIN(([UIScreen mainScreen].bounds.size.width),([UIScreen mainScreen].bounds.size.height))/375.0)*(x)//根据屏幕大小自动变化长度
#endif /* MacroUtilities_h */

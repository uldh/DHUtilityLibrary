//
//  DHSystemFunction.m
//  HsApp
//
//  Created by s1614 on 16/1/20.
//  Copyright © 2016年 s1614. All rights reserved.
//

#import "DHSystemFunction.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
NSString * const NOTIFICATION_DID_LOCAL_NOTIFY_CHANGED = @"NOTIFICATION_DID_LOCAL_NOTIFY_CHANGED";
static DHSystemFunction *instance = nil;
static int HOS_ALERT_TAG_ALBUM = 996;
static int HOS_ALERT_TAG_CAMERA = 997;
static int HOS_ALERT_TAG_ADDRESSBOOK = 998;

@implementation DHSystemFunction
+ (instancetype)share{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DHSystemFunction alloc] init];
    });
    return  instance;
}
- (BOOL)isSystemNotificationOpened{
    BOOL remoteNotificationEnable = NO;//系统中的消息提醒设置
//    if(NLSystemVersionGreaterOrEqualThan(8.0))
//    {
        if ([[UIApplication sharedApplication] isRegisteredForRemoteNotifications]) {
            remoteNotificationEnable = YES;
        }
        
//    }else
//    {
//        if (UIRemoteNotificationTypeNone != [[UIApplication sharedApplication] enabledRemoteNotificationTypes]) {
//            remoteNotificationEnable = YES;
//        }
//    }
    return remoteNotificationEnable;
}

@end

@implementation DHSystemFunction (LocalNotification)

- (void)makeLocalNotification:(NSString *)key content:(NSString *)content info:(NSString *)info after:(NSTimeInterval)seconds{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:seconds];
    //chuagjian一个本地推送
    UILocalNotification *noti = [[UILocalNotification alloc] init] ;
    if (noti) {
        //设置推送时间
        noti.fireDate = date;
        //设置时区
        noti.timeZone = [NSTimeZone defaultTimeZone];
        //设置重复间隔
        noti.repeatInterval = NSWeekCalendarUnit;
        //推送声音
        noti.soundName = UILocalNotificationDefaultSoundName;
        //内容
        noti.alertBody = content;
        //显示在icon上的红色圈中的数子
        noti.applicationIconBadgeNumber = 1;
        //设置userinfo 方便在之后需要撤销的时候使用
        NSDictionary *infoDic = @{@"key":key,@"macthInfo":info};
//        [NSDictionary dictionaryWithObject:key forKey:@"key"];

        noti.userInfo = infoDic;
        //添加推送到uiapplication
        UIApplication *app = [UIApplication sharedApplication];
        [app scheduleLocalNotification:noti];
    }
    [self performSelector:@selector(notificationChangedNotifiy) withObject:nil afterDelay:0.5];//系统的设置可能过一段才起作用，所以延迟发通知
}
- (void)cancelLocalNotification:(NSString *)key{
    //获取本地推送数组
    NSArray *localArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    //声明本地通知对象
    UILocalNotification *localNotification;
    if (localArray) {
        for (UILocalNotification *noti in localArray) {
            NSDictionary *dict = noti.userInfo;
            if (dict) {
                NSString *inKey = [dict objectForKey:@"key"];
                if ([inKey isEqualToString:key]) {
                    localNotification = noti;
                    break;
                }
            }
        }
        
//        //判断是否找到已经存在的相同key的推送
//        if (!localNotification) {
//            //不存在初始化
//            localNotification = [[UILocalNotification alloc] init];
//        }
        
        if (localNotification) {
            //不推送 取消推送
           
            [[UIApplication sharedApplication] cancelLocalNotification:localNotification];

            [self performSelector:@selector(notificationChangedNotifiy) withObject:nil afterDelay:0.5];//系统的设置可能过一段才起作用，所以延迟发通知
            return;
        }
    }
}
- (void)notificationChangedNotifiy{
    [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_DID_LOCAL_NOTIFY_CHANGED object:nil];
}
- (BOOL)isKeyFindInLocalNotification:(NSString *)key{
    //获取本地推送数组
    NSArray *localArray = [[UIApplication sharedApplication] scheduledLocalNotifications];
    BOOL isFinded = NO;
    for (UILocalNotification *noti in localArray) {
        NSDictionary *dict = noti.userInfo;
        if (dict) {
            NSString *inKey = [dict objectForKey:@"key"];
            if ([inKey isEqualToString:key]) {
                isFinded = YES;
                break;
            }
        }
    }
    return isFinded;
}
+ (void)cancelAllNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}
@end


@implementation DHSystemFunction (VisitDevice)
- (BOOL)isAvailablyForAlbum {
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author == ALAuthorizationStatusDenied){
        NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
        NSString *msg = [NSString stringWithFormat:@"请在iPhone的“设置”-“隐私”-“照片”选项中，允许%@访问你的照片。",appName];
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"相册服务未开启" message:msg delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即开启", nil];
        alert.delegate = self;
        alert.tag = HOS_ALERT_TAG_ALBUM;
        [alert show];
        return NO;
    }
    return YES;
}

- (BOOL)isAvailablyForCamera {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus  == AVAuthorizationStatusRestricted ||
       authStatus == AVAuthorizationStatusDenied ) {
        NSString* msg = [NSString stringWithFormat:@"请在“设置”-“隐私”-“相机”选项中，允许%@访问你的相机。",[[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleName"]];
        UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"相机服务未开启" message:msg delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即开启", nil];
        alterView.delegate = self;
        alterView.tag = HOS_ALERT_TAG_CAMERA;
        [alterView show];
        return NO;
    }
    return YES;
}

- (BOOL)isAvailablyForAddressBook {
    
    ABAuthorizationStatus authStatus = ABAddressBookGetAuthorizationStatus();
    if(authStatus == kABAuthorizationStatusRestricted || authStatus ==
       kABAuthorizationStatusDenied){
        NSString* msg = [NSString stringWithFormat:@"请在“设置－隐私－通讯录”选项中，允许%@访问你的通讯录。",[[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleName"]];
        UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"相机服务未开启" message:msg delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即开启", nil];
        alterView.delegate = self;
        alterView.tag = HOS_ALERT_TAG_ADDRESSBOOK;
        [alterView show];
        return NO;
    }
    return YES;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == HOS_ALERT_TAG_ALBUM) {
        if (buttonIndex == 1) {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }
        }
    }
    
    if (alertView.tag == HOS_ALERT_TAG_CAMERA) {
        if (buttonIndex == 1) {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }
        }
    }
    
    if (alertView.tag == HOS_ALERT_TAG_ADDRESSBOOK) {
        if (buttonIndex == 1) {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }
        }
    }
}

@end

@implementation DHSystemFunction (Camera)

- (BOOL)isCameraAvailable{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == PHAuthorizationStatusAuthorized){
        NSLog(@"相机可用");
        return YES;
    }else{
        return NO;
    }
}

@end



@implementation DHSystemFunction (AppInfo)

- (UIImage *)appIcon{
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSString *icon = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    UIImage* image = [UIImage imageNamed:icon];
    return image;
}

@end

@implementation DHSystemFunction (URL)

- (NSMutableDictionary *)getURLParameters:(NSString *)urlStr {
    
    // 查找参数
    NSRange range = [urlStr rangeOfString:@"?"];
    if (range.location == NSNotFound) {
        return nil;
    }
    
    // 以字典形式将参数返回
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    // 截取参数
    NSString *parametersString = [urlStr substringFromIndex:range.location + 1];
    
    // 判断参数是单个参数还是多个参数
    if ([parametersString containsString:@"&"]) {
        
        // 多个参数，分割参数
        NSArray *urlComponents = [parametersString componentsSeparatedByString:@"&"];
        
        for (NSString *keyValuePair in urlComponents) {
            // 生成Key/Value
            NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
            NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
            NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
            
            // Key不能为nil
            if (key == nil || value == nil) {
                continue;
            }
            
            id existValue = [params valueForKey:key];
            
            if (existValue != nil) {
                
                // 已存在的值，生成数组
                if ([existValue isKindOfClass:[NSArray class]]) {
                    // 已存在的值生成数组
                    NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
                    [items addObject:value];
                    
                    [params setValue:items forKey:key];
                } else {
                    
                    // 非数组
                    [params setValue:@[existValue, value] forKey:key];
                }
                
            } else {
                
                // 设置值
                [params setValue:value forKey:key];
            }
        }
    } else {
        // 单个参数
        
        // 生成Key/Value
        NSArray *pairComponents = [parametersString componentsSeparatedByString:@"="];
        
        // 只有一个参数，没有值
        if (pairComponents.count == 1) {
            return nil;
        }
        
        // 分隔值
        NSString *key = [pairComponents.firstObject stringByRemovingPercentEncoding];
        NSString *value = [pairComponents.lastObject stringByRemovingPercentEncoding];
        
        // Key不能为nil
        if (key == nil || value == nil) {
            return nil;
        }
        
        // 设置值
        [params setValue:value forKey:key];
    }
    
    return params;
}  
@end


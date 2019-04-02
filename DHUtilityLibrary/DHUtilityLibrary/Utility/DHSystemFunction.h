//
//  DHSystemFunction.h
//  HsApp
//
//  Created by s1614 on 16/1/20.
//  Copyright © 2016年 s1614. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const NOTIFICATION_DID_LOCAL_NOTIFY_CHANGED;

@interface DHSystemFunction : NSObject

+ (instancetype)share;
- (BOOL)isSystemNotificationOpened;
@end

@interface DHSystemFunction (LocalNotification)//本地推送提醒
- (void)makeLocalNotification:(NSString *)key content:(NSString *)content info:(NSString *)info after:(NSTimeInterval)seconds;
- (void)cancelLocalNotification:(NSString *)key;
- (BOOL)isKeyFindInLocalNotification:(NSString *)key;
+ (void)cancelAllNotification;

@end

@interface DHSystemFunction(Camera)
- (BOOL)isCameraAvailable;
@end

@interface DHSystemFunction (VisitDevice)
- (BOOL)isAvailablyForAlbum;

- (BOOL)isAvailablyForCamera;

- (BOOL)isAvailablyForAddressBook;
@end

@interface DHSystemFunction (AppInfo)
- (UIImage *)appIcon;

@end

@interface DHSystemFunction (URL)
- (NSMutableDictionary *)getURLParameters:(NSString *)urlStr;//获取 URL 的参数，以 DICT 形式返回
@end

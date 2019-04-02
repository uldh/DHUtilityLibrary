//
//  OTUniversalMethod.h
//  HsApp
//
//  Created by s1614 on 16/1/20.
//  Copyright © 2016年 s1614. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTUniversalMethod : NSObject

+ (instancetype)share;
- (BOOL)isSystemNotificationOpened;
@end

@interface OTUniversalMethod (LocalNotification)
- (void)makeLocalNotification:(NSString *)key content:(NSString *)content info:(NSString *)info after:(NSTimeInterval)seconds;
- (void)cancelLocalNotification:(NSString *)key;
- (BOOL)isKeyFindInLocalNotification:(NSString *)key;
+ (void)cancelAllNotification;

@end

@interface OTUniversalMethod(Camera)
- (BOOL)isCameraAvailable;
@end

@interface OTUniversalMethod (VisitDevice)
- (BOOL)isAvailablyForAlbum;

- (BOOL)isAvailablyForCamera;

- (BOOL)isAvailablyForAddressBook;
@end

@interface OTUniversalMethod (AppInfo)
- (UIImage *)appIcon;

@end

@interface OTUniversalMethod (URL)
- (NSMutableDictionary *)getURLParameters:(NSString *)urlStr;//获取 URL 的参数，以 DICT 形式返回
@end

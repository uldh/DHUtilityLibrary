//
//  BlzError.m
//  HsApp
//
//  Created by HSH-D-2213 on 15/12/24.
//  Copyright © 2015年 s1614. All rights reserved.
//

#import "NSError+extension.h"

#define BLZErrorDomain          @"BLZErrorDomain"
#define BLZErrorCommonCode      900

@implementation NSError (BLZError)
+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code localDescription:(NSString *)localDes {
    NSDictionary *userInfo = [[NSDictionary alloc]
                              initWithObjectsAndKeys:localDes,
                              NSLocalizedDescriptionKey,NULL];
    return [NSError errorWithDomain:domain code:code userInfo:userInfo];
}

+ (NSError *)errorWithLocalDescription:(NSString *)localDes {
    NSDictionary *userInfo = [[NSDictionary alloc]
                              initWithObjectsAndKeys:localDes,
                              NSLocalizedDescriptionKey,NULL];
    return [NSError errorWithDomain:BLZErrorDomain code:BLZErrorCommonCode userInfo:userInfo];
}

+ (NSError *)errorWithError:(NSError *)error {
    NSString* localizedString = @"NETWOTK_FIALED_TIPS";
    if (error.code == 404 ||
        error.code == 500 ||
        error.code == 400 ) {
        localizedString = @"NETWOTK_NOT_WORK_TIPS";
    }
    return [self errorWithLocalDescription:localizedString];
}


@end

//
//  BlzError.h
//  HsApp
//
//  Created by HSH-D-2213 on 15/12/24.
//  Copyright © 2015年 s1614. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSError (BLZError)
+ (NSError *)errorWithDomain:(NSString *)domain code:(NSInteger)code localDescription:(NSString *)localDes;
+ (NSError *)errorWithLocalDescription:(NSString *)localDes;
+ (NSError *)errorWithError:(NSError *)error;

@end

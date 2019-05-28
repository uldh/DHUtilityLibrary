//
//  NSObject+JSON.h
//  WowApp
//
//  Created by ldh on 2019/5/28.
//  Copyright © 2019 s1614. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JSON)
+ (NSDictionary *)dictionaryByJSON:(id)json;
@end

NS_ASSUME_NONNULL_END

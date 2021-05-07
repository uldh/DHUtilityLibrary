//
//  FileManager.h
//  DHUtilityLibrary
//
//  Created by ldh on 2021/5/7.
//  Copyright © 2021 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileManager : NSObject
+ (NSDictionary *)readLocalFileWithName:(NSString *)name ;
@end

NS_ASSUME_NONNULL_END

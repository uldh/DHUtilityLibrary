//
//  DHFileManager.h
//  WebCollector
//
//  Created by apple on 2018/12/16.
//  Copyright © 2018 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHFileManager : NSObject
{
    NSFileManager *manager;
}

+ (instancetype)sharedManager;

- (BOOL)isFileExistFor:(NSString *)file;
- (BOOL)isFileAvalibleFor:(NSString *)file;
- (NSString *)pathForFile:(NSString *)file;

- (NSString *)hosAppDocuments;
- (NSString *)hosAppDocumentsWithfileName:(NSString *)fileName inDirectory:(NSString *)dir;

- (BOOL)removeFileAtPath:(NSString *)filePath error:(NSError**)error;
@end

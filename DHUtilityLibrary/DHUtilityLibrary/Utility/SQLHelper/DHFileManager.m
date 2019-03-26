//
//  DHFileManager.m
//  WebCollector
//
//  Created by apple on 2018/12/16.
//  Copyright © 2018 apple. All rights reserved.
//

#import "DHFileManager.h"
#include <sys/xattr.h>

@interface DHFileManager()
{
    NSBundle *mainBoundle;
    NSString *documents;
    NSString *cache;
}

@end

static DHFileManager *sharedFileManager = nil;

@implementation DHFileManager
+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedFileManager = [[DHFileManager alloc] init];
    });
    return sharedFileManager;
}
- (id)init
{
    self = [super init];
    if (self) {
        manager     = [NSFileManager defaultManager];
        mainBoundle = [NSBundle mainBundle];
        documents   = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        cache       = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        [self hosAppDocuments];
    }
    return self;
}

- (BOOL)isFileExistFor:(NSString *)file
{
    NSString *path = [self pathForFile:file];
    if (path) {
        return YES;
    }
    return NO;
}

- (BOOL)isFileAvalibleFor:(NSString *)file
{
    NSString *path = [self pathForFile:file];
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data && path) {
        return YES;
    }
    return NO;
}

- (NSString *)pathForFile:(NSString *)file
{
    return [self pathForFile:file ofType:nil];
}

- (NSString *)pathForFile:(NSString *)file ofType:(NSString *)type
{
    NSString *path = nil;
    path = [mainBoundle pathForResource:file ofType:type];
    if (path) {
        return path;
    }
    return nil;
}


- (NSString *)hosAppDocuments
{
    NSString *libraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSString *privateDocs = [libraryDirectory stringByAppendingPathComponent:@"PrivateDocuments"];
    NSError *error;
    if (![manager fileExistsAtPath:privateDocs]) {
        [manager createDirectoryAtPath:privateDocs withIntermediateDirectories:YES attributes:nil error:&error];
        [self addSkipBackupAttributeToItemAtURL:[NSURL URLWithString:privateDocs]];
    }
    if (!error) {
        return privateDocs;
    }
    return @"";
}

- (NSString *)hosAppDocumentsWithfileName:(NSString *)fileName inDirectory:(NSString *)dir
{
    NSString *dirPath = [[self hosAppDocuments] stringByAppendingPathComponent:dir];
    if (dir || ![manager fileExistsAtPath:dirPath]) {
        [manager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return [dirPath stringByAppendingPathComponent:fileName];
}

- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    const char* filePath = [[URL path] fileSystemRepresentation];
    
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    
    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    return result == 0;
}

- (BOOL)removeFileAtPath:(NSString *)filePath error:(NSError**)error
{
   return [manager removeItemAtPath:filePath error:error];
}

@end

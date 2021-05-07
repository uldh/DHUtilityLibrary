//
//  FileManager.m
//  DHUtilityLibrary
//
//  Created by ldh on 2021/5/7.
//  Copyright © 2021 apple. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager
+ (instancetype)sharedInstance
{
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}
// 读取本地JSON文件 [[FileManager sharedInstance]readLocalFileWithName:"jsonName"];
+ (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}
@end

//
//  SystemSound.h
//  DHUtilityLibrary
//
//  Created by Ant on 2019/4/5.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SystemSound : NSObject
+(instancetype)shareInstance;
- (NSArray *)loadAudioFileList;
- (NSString *)soundNameWithID:(NSUInteger)soundIndex;
- (void)playSoundWithID:(NSUInteger)soundIndex;
//待添加一个根据名字播放声音的方法
@end

NS_ASSUME_NONNULL_END

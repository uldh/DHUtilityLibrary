//
//  SystemSound.m
//  DHUtilityLibrary
//
//  Created by Ant on 2019/4/5.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SystemSound.h"
#import <AudioToolbox/AudioToolbox.h>

@interface SystemSound()
@property (strong, nonatomic) NSMutableArray *audioFileList;
@end
@implementation SystemSound

+(instancetype)shareInstance{
    static SystemSound *share = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[SystemSound alloc]init];
    });
    return share;
}

-(NSArray *)loadAudioFileList{
    self.audioFileList = [[NSMutableArray alloc] init];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSURL *directoryURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds"];
    NSArray *keys = [NSArray arrayWithObject:NSURLIsDirectoryKey];
    
    NSDirectoryEnumerator *enumerator = [fileManager
                                         enumeratorAtURL:directoryURL
                                         includingPropertiesForKeys:keys
                                         options:0
                                         errorHandler:^(NSURL *url, NSError *error) {
                                             // Handle the error.
                                             // Return YES if the enumeration should continue after the error.
                                             return YES;
                                         }];
    
    for (NSURL *url in enumerator) {
        NSError *error;
        NSNumber *isDirectory = nil;
        if (! [url getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&error]) {
            // handle error
        }
        else if (! [isDirectory boolValue]) {
            [self.audioFileList addObject:url];
        }
    }
    return self.audioFileList;
}
- (NSString *)soundNameWithID:(NSUInteger)soundIndex{
    NSString * name =[[self.audioFileList objectAtIndex:soundIndex] lastPathComponent];
    return name;
}
- (void)playSoundWithID:(NSUInteger)soundIndex{
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)[self.audioFileList objectAtIndex:soundIndex],&soundID);
    AudioServicesPlaySystemSound(soundID);
    
    NSLog(@"File url: %@", [[self.audioFileList objectAtIndex:soundIndex] description]);
}
@end

//
//  NaviForStatusBarViewController.m
//  DHUtilityLibrary
//
//  Created by ldh on 2019/12/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NaviForStatusBarViewController.h"

@interface NaviForStatusBarViewController ()

@end

@implementation NaviForStatusBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController *topVC = self.topViewController;
    return [topVC preferredStatusBarStyle];
}


@end

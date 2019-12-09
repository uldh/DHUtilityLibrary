//
//  ViewController.m
//  DHUtilityLibrary
//
//  Created by apple on 2018/10/20.
//  Copyright © 2018 apple. All rights reserved.
//

#import "ViewController.h"
#import "StatusBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickedButton:(id)sender{
    StatusBarViewController * vc = [StatusBarViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end

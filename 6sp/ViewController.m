//
//  ViewController.m
//  6sp
//
//  Created by baotiao ni on 16/7/8.
//  Copyright © 2016年 xijian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 状态栏(statusbar)
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"status width - %f", rectStatus.size.width); // 宽度
    NSLog(@"status height - %f", rectStatus.size.height);   // 高度
    
    // 导航栏（navigationbar）
    CGRect rectNav = self.navigationController.navigationBar.frame;
    NSLog(@"nav width - %f", rectNav.size.width); // 宽度
    NSLog(@"nav height - %f", rectNav.size.height);   // 高度
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    NSLog(@"screen width - %f", screenRect.size.width); // 宽度
    NSLog(@"screen height - %f", screenRect.size.height);   // 高度
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

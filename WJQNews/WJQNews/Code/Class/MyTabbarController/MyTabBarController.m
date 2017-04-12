//
//  MyTabBarController.m
//  WJQNews
//
//  Created by 吴俊秋 on 2017/4/12.
//  Copyright © 2017年 JackWu. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "HotViewController.h"
#import "MyNavigationController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    MyNavigationController *homeNavVC = [[MyNavigationController alloc]initWithRootViewController:homeVC];
    homeNavVC.title = @"首页";
    
    HotViewController *hotVC = [[HotViewController alloc]init];
    MyNavigationController *hotNavVC = [[MyNavigationController alloc]initWithRootViewController:hotVC];
    hotNavVC.title = @"热闻";
    
    self.viewControllers = @[homeNavVC,hotNavVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

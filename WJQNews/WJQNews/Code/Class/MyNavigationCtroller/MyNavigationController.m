//
//  MyNavigationController.m
//  WJQNews
//
//  Created by 吴俊秋 on 2017/4/12.
//  Copyright © 2017年 JackWu. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self initialMyNavigationController];
    }
    return self;
}

- (void)initialMyNavigationController {
    //设置tabbar按钮未选中状态文字大小、颜色
    UIFont *unSelectFont = [UIFont boldSystemFontOfSize:12];
    UIColor *unSelectColor = [UIColor grayColor];
    NSMutableDictionary *attributDicNor = [NSMutableDictionary dictionary];
    [attributDicNor setValue:unSelectFont forKey:NSFontAttributeName];
    [attributDicNor setValue:unSelectColor forKey:NSForegroundColorAttributeName];
    
    //设置tabbar按钮选中状态文字大小、颜色
    UIFont *selectFont = [UIFont boldSystemFontOfSize:12];
    UIColor *selectColor = [UIColor blackColor];
    NSMutableDictionary *attributDicSelect = [NSMutableDictionary dictionary];
    [attributDicSelect setValue:selectFont forKey:NSFontAttributeName];
    [attributDicSelect setValue:selectColor forKey:NSForegroundColorAttributeName];
    
    [self.tabBarItem setTitleTextAttributes:attributDicNor forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:attributDicSelect forState:UIControlStateSelected];
    
    
    //设置导航字体大小和颜色
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setValue:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    [attributes setValue:[UIFont boldSystemFontOfSize:17] forKey:NSFontAttributeName];
    self.navigationBar.titleTextAttributes = attributes;
    
    //导航颜色
    self.navigationBar.barTintColor = [UIColor whiteColor];
    
    //导航返回按钮颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

//
//  CustomTabBarViewController.m
//  test4
//
//  Created by tangbo on 15/8/25.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "CustomTabBarViewController.h"

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar removeFromSuperview];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, size.height-44, size.width, 44)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
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

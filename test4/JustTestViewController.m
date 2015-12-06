//
//  JustTestViewController.m
//  test4
//
//  Created by tangbo on 15/9/16.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "JustTestViewController.h"

@interface JustTestViewController ()

@end

@implementation JustTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollview = [UIScrollView new];
    scrollview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:scrollview];
    
    UIView *red = [UIView new];
    red.backgroundColor = [UIColor redColor];
    [scrollview addSubview:red];
    
    [scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    [red mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000));
    }];
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

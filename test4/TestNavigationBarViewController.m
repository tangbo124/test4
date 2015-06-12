//
//  TestNavigationBarViewController.m
//  test4
//
//  Created by tangbo on 15/5/21.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestNavigationBarViewController.h"
#import "Masonry.h"
#import "TestNavi2ViewController.h"

@interface TestNavigationBarViewController ()

@end

@implementation TestNavigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"1";
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
//    self.navigationController.navigationBarHidden = YES;
}

- (void)btnClick:(id)sender {
    TestNavi2ViewController *vc = [[TestNavi2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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

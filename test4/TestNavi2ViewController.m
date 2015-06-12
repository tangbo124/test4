//
//  TestNavi2ViewController.m
//  test4
//
//  Created by tangbo on 15/5/22.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestNavi2ViewController.h"
#import "BlockView.h"

@interface TestNavi2ViewController ()

@end

@implementation TestNavi2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"2";
    self.view.backgroundColor = [UIColor redColor];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
    /*
     *改变UINavigationBar之后, 依然可以滑动pop
     */
//    if ([self.navigationController  respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    NSLog(@"我释放了");
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

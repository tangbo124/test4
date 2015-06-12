//
//  TestProtocolViewController.m
//  test4
//
//  Created by tangbo on 15/6/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestProtocolViewController.h"
#import "XiaoMing.h"

@interface TestProtocolViewController ()

@end

@implementation TestProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XiaoMing *xiao = [[XiaoMing alloc] init];
    [xiao age];
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

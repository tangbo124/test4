//
//  SecondTransitionViewController.m
//  test4
//
//  Created by tangbo on 15/4/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "SecondTransitionViewController.h"

@interface SecondTransitionViewController ()

@end

@implementation SecondTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"消失" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[btn(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[btn(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)];
    [self.view addConstraints:constraintH];
    [self.view addConstraints:constraintV];
}

- (void)btnClick:(id)sender
{
    if (self.btnCLickBlock) {
        self.btnCLickBlock();
    }
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

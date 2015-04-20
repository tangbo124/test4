//
//  LabelAutoFitViewController.m
//  test4
//
//  Created by tangbo on 15/4/15.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "LabelAutoFitViewController.h"

@interface LabelAutoFitViewController ()

@property (nonatomic, strong) UILabel *namelabel;

@end

@implementation LabelAutoFitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*UILabel在自动布局下自动换行
     <1>设置numberOfLines = 0
     <2>,只设置宽度, 不设置高度
     
     如果高度跟宽度都没有设置的话, UILabel的宽度和高度会根据内容大小在一行上来展示
     */
    self.namelabel = [[UILabel alloc] init];
    self.namelabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.namelabel.backgroundColor = [UIColor greenColor];
    self.namelabel.text = @"hello, world!唐波hello, world!唐波hello, world!唐波hello, world!唐波hello, world!唐波hello, world!唐波hello, world!唐波";
    self.namelabel.numberOfLines = 0;
    [self.view addSubview:self.namelabel];
    
    NSArray *constranint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_namelabel(200)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_namelabel)];
    
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[_namelabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_namelabel, _namelabel)];
    
    [self.view addConstraints:constranint1];
    [self.view addConstraints:constraint2];
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

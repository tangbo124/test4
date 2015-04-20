//
//  AutoLayoutViewController.m
//  test4
//
//  Created by TangBo on 15/3/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController
{
    UIView *view1;
    UIView *view2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self testAutoLayout];
    [self addBtn];
}

- (void)testAutoLayout
{
    view1 = [[UIView alloc] init];
    /*
     *view1.translatesAutoresizingMaskIntoConstraints = NO必须位于init函数之后,否则会报错
     */
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];

    view2 = [[UIView alloc] init];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];
    
    NSArray *constranint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view1(50)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1)];
    
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[view1(100)]-8-[view2(200)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1, view2)];
    
    NSArray *constranint3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[view2(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view2)];
    [self.view addConstraints:constranint1];
    [self.view addConstraints:constraint2];
    [self.view addConstraints:constranint3];
//    [NSLayoutConstraint activateConstraints:constranint1];
//    [NSLayoutConstraint activateConstraints:constraint2];
//    [NSLayoutConstraint activateConstraints:constranint3];
    
    [view2 layoutIfNeeded];//可以得到view2的frame
    
    NSLog(@"frame : %@", NSStringFromCGRect(view2.frame));
}

- (void)addBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitle:@"改变View1位置" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:btn];
    
    NSArray *constranint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[btn]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)];
    NSArray *constranint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-400-[btn]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)];

    [NSLayoutConstraint activateConstraints:constranint1];
    [NSLayoutConstraint activateConstraints:constranint2];
}

- (void)btnClick:(id)sender
{
    
    NSLog(@"frame : %@", NSStringFromCGRect(view2.frame));
    
    NSArray *constranints = [view2 constraintsAffectingLayoutForAxis:UILayoutConstraintAxisHorizontal];
    
    [constranints enumerateObjectsUsingBlock:^(NSLayoutConstraint *con, NSUInteger idx, BOOL *stop) {
        if (con.firstItem == view2 && con.firstAttribute == NSLayoutAttributeLeading) {
            [UIView animateWithDuration:1.0f animations:^{
               con.constant = 50;
               [view2 layoutIfNeeded];
                *stop = YES;
            }];
        }
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

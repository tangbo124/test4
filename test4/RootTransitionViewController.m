//
//  RootTransitionViewController.m
//  test4
//
//  Created by tangbo on 15/4/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "RootTransitionViewController.h"
#import "SecondTransitionViewController.h"
#import "RotationPresentAnimation.h"

@interface RootTransitionViewController ()
@property (nonatomic, strong) RotationPresentAnimation *animation;
@property (nonatomic, strong) SecondTransitionViewController *vc;
@end

@implementation RootTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[btn(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)];
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[btn(30)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(btn)];
//    [self.view addConstraints:@[constraintH, constraintV]];
    [self.view addConstraints:constraintH];
    [self.view addConstraints:constraintV];
    
    self.animation = [[RotationPresentAnimation alloc] init];
    
    self.vc = [[SecondTransitionViewController alloc] init];
    __weak typeof(self) weakSelf = self;
    self.vc.btnCLickBlock = ^(){
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    self.vc.transitioningDelegate = self;
}

- (void)btnClick:(id)sender
{
    [self presentViewController:self.vc animated:YES completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.animation;
}

/*
 *dismiss时需要实现这个方法
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.animation;
}
*/
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

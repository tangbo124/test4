//
//  TestQuarzViewController.m
//  test4
//
//  Created by TangBo on 15/2/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestQuarzViewController.h"
#import "CircleView.h"
@interface TestQuarzViewController ()

@end

@implementation TestQuarzViewController
{
    CircleView *circleView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    circleView = [[CircleView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    circleView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:circleView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 200, 100, 50);
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"刷新圆形" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClock:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClock:(id)sender
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (CGFloat i = 0; i <= 1;) {
            circleView.process = i;
            dispatch_async(dispatch_get_main_queue(), ^{
                [circleView setNeedsDisplay];
            });
            i += 0.0001f;
            NSLog(@"i = %f", i);
        }
    });
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

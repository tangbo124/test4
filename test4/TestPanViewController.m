//
//  TestPanViewController.m
//  test4
//
//  Created by tangbo on 15/5/22.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestPanViewController.h"

@interface TestPanViewController ()

@end

@implementation TestPanViewController
{
    CGPoint lastPoint;
    UIView *tranView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    tranView = redView;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [redView addGestureRecognizer:pan];
    */
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];    
    
    UILabel *label = [[UILabel alloc] initWithFrame:btn.frame];
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];

}

- (void)btnClick:(id)sender {
    NSLog(@"点我了!!!!");
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint point = [pan locationInView:self.view];
    
    NSLog(@"%@", NSStringFromCGPoint(point));
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        tranView.userInteractionEnabled = NO;
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        CGFloat tran = point.x - lastPoint.x;
        CGRect frame = tranView.frame;
        frame.origin.x += tran;
        tranView.frame = frame;
    }
        lastPoint = point;
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

//
//  UIDynamicsViewController.m
//  test4
//
//  Created by TangBo on 15/2/4.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "UIDynamicsViewController.h"

@interface UIDynamicsViewController ()

@end

@implementation UIDynamicsViewController
{
    /**
     *UIDynamicAnimator必须作为全局变量, 保证不被释放
     */
    UIDynamicAnimator *animator;
    
    UIView *snapView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

//    [self testUIGravityBehavior];
//    [self testCollisionBehavior];
    [self testSnapBehavior];
}

/**
 *  重力行为
 */
- (void)testUIGravityBehavior
{
    UIView *animatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 100, 50)];
    animatorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:animatorView];
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[animatorView]];
    /**
     *  施加的作用力
     *
     *  @param 0.0 x轴方向的作用力
     *  @param 0.1 Y轴方向的作用力
     */
    gravity.gravityDirection = CGVectorMake(0.0, 0.1);
    [animator addBehavior:gravity];
}

/**
 *  碰撞检测
 */
- (void)testCollisionBehavior
{
    UIView *animatorView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 100, 50)];
    animatorView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:animatorView1];
    
    UIView *animatorView2 = [[UIView alloc] initWithFrame:CGRectMake(120, 20, 100, 50)];
    animatorView2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:animatorView2];
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[animatorView1, animatorView2]];
    /**
     *  施加的作用力
     *
     *  @param 0.0 x轴方向的作用力
     *  @param 0.1 Y轴方向的作用力
     */
    gravity.gravityDirection = CGVectorMake(0.0, 0.5);
    [animator addBehavior:gravity];
    
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[animatorView1, animatorView2]];
    /**
     *UICollisionBehaviorModeBoundaries 表示物体不相互碰撞, 只与边界碰撞
     */
    collision.collisionMode = UICollisionBehaviorModeBoundaries;
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collision];
}

/**
 *  吸附行为
 */
- (void)testSnapBehavior
{
    snapView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 100, 50)];
    snapView.backgroundColor = [UIColor redColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAnimatorView:)];
    [self.view addGestureRecognizer:tap];
    [self.view addSubview:snapView];
}

- (void)tapAnimatorView:(UITapGestureRecognizer *)tap
{
    CGPoint point = [tap locationInView:self.view];
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:snapView snapToPoint:point];
    snap.damping = 0.75f;
    [animator addBehavior:snap];
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

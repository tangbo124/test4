//
//  AnimationViewController.m
//  test4
//
//  Created by TangBo on 15/2/10.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController
{
    UIImageView *_imageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    _imageView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:_imageView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 300, 100, 30);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开始动画" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)tranAction:(id)sender {
    CGPoint fromPoint = _imageView.center;
    
    //路径曲线
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:fromPoint];//曲线开始的点
    CGPoint toPoint = CGPointMake(300, 460);
    [movePath addQuadCurveToPoint:toPoint controlPoint:CGPointMake(300,0)];
    //关键帧
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    
    //缩小变化
    /**
     *CABasicAnimation主要用来改变CALayer的属性
     */
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //x，y轴缩小到0.1,Z 轴不变
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)];

    //透明度变化
    CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
    opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
    
    //关键帧，旋转，透明度组合起来执行
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, scaleAnim, opacityAnim, nil];
    animGroup.duration = 3;
    /**
     *  设置removedOnCompletion=NO, 以及fillMode=kCAFillModeForwards, 会使UIView的动画结束后保持最后的状态
     */
    animGroup.removedOnCompletion = NO;
    animGroup.fillMode = kCAFillModeForwards;
    [_imageView.layer addAnimation:animGroup forKey:nil];
}

- (void)btnClick1:(id)sender
{
    NSLog(@"%@", NSStringFromCGRect([UIScreen mainScreen].bounds));
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
//    animation.fromValue = @0;
    animation.toValue = @320;
    animation.duration = 1;
    
    //使留在最终状态，设置removedOnCompletion为No以防止它被自动移除
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [_imageView.layer addAnimation:animation forKey:@"basic"];
    NSLog(@"%@", NSStringFromCGRect(_imageView.frame));
}

- (void)btnClick2:(id)sender
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[@0, @100, @200, @0];
    animation.keyTimes = @[@0, @(0.1), @(0.8), @1];
    animation.duration = 1;
    /*additive=YES表示_imageView的动画位置偏移是相对于当前_imageView的frame,
     例如上面的animation.values = @[@0, @100, @200, @0], 表示_imageView开始动画时的偏移是100,也就是说_imageView的位置是_imageView.frame.origin.x+100, 而不是使_imageView.frame.origin.x=100
     */
    //cumulative=YES表示当前动画会从动画的结束位置重新开始动画
    animation.additive = YES;
    
    [_imageView.layer addAnimation:animation forKey:@"shake"];
}

- (void)btnClick3:(id)sender
{
    CGRect boundingRect = CGRectMake(0, 0, 200, 200);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithRect(boundingRect, NULL));
    orbit.duration = 4;
    
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [_imageView.layer addAnimation:orbit forKey:@"orbit"];
}

- (void)btnClick4:(id)sender
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
//    animation.fromValue = @50;
    animation.toValue = @300;
    animation.duration = 1;
    
    //timingFunction决定动画师先快后慢还是平滑进行
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [_imageView.layer addAnimation:animation forKey:@"basic"];

//    _imageView.layer.position = CGPointMake(150, 0);
}

- (void)btnClick5:(id)sender
{
    CATransition *ani = [CATransition animation];
    ani.type = kCATransitionReveal;
    ani.subtype = kCATransitionFromRight;
    ani.duration = 1.0f;
//    ani.removedOnCompletion = NO;
//    ani.fillMode = kCAFillModeForwards;
    [_imageView.layer addAnimation:ani forKey:nil];
 
    _imageView.hidden = YES;
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

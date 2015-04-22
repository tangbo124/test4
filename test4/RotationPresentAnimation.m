//
//  RotationPresentAnimation.m
//  test4
//
//  Created by tangbo on 15/4/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "RotationPresentAnimation.h"

@implementation RotationPresentAnimation
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    /*
     *present代码
     */
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect rect = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(rect, 0, [UIScreen mainScreen].bounds.size.height);
    [[transitionContext containerView] addSubview:toVC.view];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = rect;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    /*
     *dismiss代码
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect initRect = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalRect = [transitionContext finalFrameForViewController:fromVC];
    [[transitionContext containerView] addSubview:toVC.view];
    [[transitionContext containerView] sendSubviewToBack:toVC.view];
    NSLog(@"initRect=%@, finalRect=%@", NSStringFromCGRect(initRect), NSStringFromCGRect(finalRect));
    [UIView animateWithDuration:0.6f animations:^{
        fromVC.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
//        fromVC.view.frame = CGRectOffset(initRect, 0, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        fromVC.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:YES];
    }];
     */
}
@end

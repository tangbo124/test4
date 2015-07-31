//
//  CAGradientLayerViewController.m
//  test4
//
//  Created by tangbo on 15/7/27.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()

@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor purpleColor];
    label.text = @"1111111111111111111111111111111111111111111";
    [self.view addSubview:label];
    
    CAGradientLayer *colorLayer = [CAGradientLayer layer];
    colorLayer.frame = label.bounds;
    //mask: 当一个有alpha通道的图层作为另一个layer的mask属性后，该图层只会保留和另一个layer非透明区域重叠的部分.
    label.layer.mask = colorLayer;
    
    // 颜色分配
    colorLayer.colors = @[(__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor,
                          (__bridge id)[UIColor whiteColor].CGColor,
                          (__bridge id)[[UIColor whiteColor] colorWithAlphaComponent:0.5].CGColor];
    
    // 颜色分割线
    colorLayer.locations  = @[@(0), @(0.05), @(0.1)];
    
    // 起始点
    colorLayer.startPoint = CGPointMake(0, 0);
    
    // 结束点
    colorLayer.endPoint   = CGPointMake(1, 0);
}

- (void)justTest
{
    /*
     UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
     imgView.image = [UIImage imageNamed:@"1"];
     [self.view addSubview:imgView];
     
     CALayer *layer1 = [CALayer layer];
     layer1.frame = CGRectMake(0, 0, 50, 100);
     layer1.backgroundColor = [UIColor blackColor].CGColor;
     
     CALayer *layer2 = [CALayer layer];
     layer2.frame = CGRectMake(50, 0, 50, 100);
     layer2.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
     
     CALayer *layer = [CALayer layer];
     layer.frame = CGRectMake(0, 0, 100, 100);
     [layer addSublayer:layer1];
     [layer1 addSublayer:layer2];
     imgView.layer.mask = layer;
     
     CABasicAnimation *animation = [CABasicAnimation animation];
     animation.keyPath = @"position.x";
     animation.toValue = @100;
     animation.duration = 3;
     
     //使留在最终状态，设置removedOnCompletion为No以防止它被自动移除
     animation.fillMode = kCAFillModeForwards;
     animation.removedOnCompletion = NO;
     [layer1 addAnimation:animation forKey:@"basic"];
     */
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    [self.view addSubview:view];
    
    CAGradientLayer *glayer = [CAGradientLayer layer];
    glayer.frame = view.bounds;
    glayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                      (__bridge id)[UIColor blueColor].CGColor,
                      (__bridge id)[UIColor yellowColor].CGColor,
                      (__bridge id)[UIColor orangeColor].CGColor,
                      ];
    glayer.locations = @[@(0.1), @(0.5), @(0.75)];
    glayer.startPoint = CGPointMake(0, 0);
    glayer.endPoint = CGPointMake(1, 1);
    [view.layer addSublayer:glayer];
    
    CAShapeLayer *slayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:UIEdgeInsetsInsetRect(view.bounds, UIEdgeInsetsMake(10, 10, 10, 10))];
    slayer.path = path.CGPath;
    slayer.strokeColor = [UIColor blackColor].CGColor;
    slayer.lineWidth = 10.f;
    slayer.fillColor = [UIColor clearColor].CGColor;
    view.layer.mask = slayer;
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

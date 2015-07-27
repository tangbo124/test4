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

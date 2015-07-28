//
//  OffScreenViewController.m
//  test4
//
//  Created by tangbo on 15/7/28.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "OffScreenViewController.h"
#import "MyCornerView.h"

@interface OffScreenViewController ()

@end

@implementation OffScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    MyCornerView *myView = [[MyCornerView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myView];
    
    CAShapeLayer *layper = [[CAShapeLayer alloc] init];
    layper.frame = myView.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layper.frame cornerRadius:5];
    layper.path = path.CGPath;
    //mask会导致离屏渲染, 影响性能
    myView.layer.mask = layper;
}

//- (UIImage *)clipImage:(UIImage *)image size:(CGSize)size {
//    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
//    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
//    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImg;
//}

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

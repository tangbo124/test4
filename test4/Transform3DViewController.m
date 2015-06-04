//
//  Transform3DViewController.m
//  test4
//
//  Created by tangbo on 15/6/4.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "Transform3DViewController.h"

@interface Transform3DViewController ()

@end

@implementation Transform3DViewController
{
    UIImageView *view1;
    UIImageView *view2;
    UISlider *slider;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    view1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 640/3, 947/3)];
    view1.backgroundColor = [UIColor redColor];
    view1.image = [UIImage imageNamed:@"hotgirl1"];
    
    /**
     *设置锚点之后位置会有偏移, 所以需要重新赋值frame
     */
    CGRect frame = view1.frame;
    view1.layer.anchorPoint = CGPointMake(1, 0.5);
    view1.frame = frame;

    
    view2 = [UIImageView new];
    view2.backgroundColor = [UIColor greenColor];
    view2.image = [UIImage imageNamed:@"hotgirl2"];
    
    
    
    slider = [UISlider new];
    slider.minimumValue = 0.0f;
    slider.maximumValue = 1.0f;
    [slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:slider];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_right);
        make.top.equalTo(view1);
        make.size.equalTo(view1);
    }];
    
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.mas_bottom).offset(20);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(30);
    }];
}

- (void)slider:(UISlider *)s {
//    [self rotateWithView:view1 angle:s.value];
//    [self translateWIthView:view1 angle:s.value];
//    [self scaleWIthView:view1 angle:s.value];
//    [self concatWithView:view1 angle:s.value];
    [self concat3DWithView:view1 angle:s.value];
}

#pragma mark - 3D旋转
- (void)rotateWithView: (UIView *)view angle: (CGFloat)angle {
    CGFloat rotateAngle = angle * M_PI;
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = - 1.0 / 800.0;
    transform1 = CATransform3DRotate(transform1, rotateAngle, 0, 1, 0);
    view.layer.transform = transform1;
}

#pragma mark - 3D位移
- (void)translateWIthView: (UIView *)view angle: (CGFloat)angle {
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = - 1.0 / 800.0;
    //位移轴有一种放大缩小的效果
    transform1 = CATransform3DTranslate(transform1, 0, 0, 100*angle);
    view.layer.transform = transform1;
}

#pragma mark - 3D缩放
- (void)scaleWIthView: (UIView *)view angle: (CGFloat)angle {
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = - 1.0 / 800.0;
    //z轴缩放没有效果
    transform1 = CATransform3DScale(transform1, 1-angle, 1-angle, 1);
    view.layer.transform = transform1;
}

#pragma mark - 混合3D变换
- (void)concatWithView: (UIView *)view angle: (CGFloat)angle {
    CGFloat rotateAngle = angle * M_PI;
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = - 1.0 / 800.0;
    transform1 = CATransform3DRotate(transform1, rotateAngle, 0, 1, 0);
    transform1 = CATransform3DTranslate(transform1, 0, 100*angle, 0);
    view.layer.transform = transform1;
}

#pragma mark - 使用CATransform3DConcat联合2个3D变换进行混合
- (void)concat3DWithView: (UIView *)view angle: (CGFloat)angle {
    CGFloat rotateAngle = angle * M_PI;
    CATransform3D transform1 = CATransform3DIdentity;
    transform1.m34 = - 1.0 / 800.0;
    CATransform3D rotate = CATransform3DRotate(transform1, rotateAngle, 0, 1, 0);
    CATransform3D translation = CATransform3DMakeTranslation(0, 100*angle, 0);
    view.layer.transform =  CATransform3DConcat(rotate, translation);
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

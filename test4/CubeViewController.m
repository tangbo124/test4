//
//  CubeViewController.m
//  test4
//
//  Created by tangbo on 15/6/4.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "CubeViewController.h"
#import <GLKit/GLKit.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5
@interface CubeViewController ()

@end

@implementation CubeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    containerView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    [self.view addSubview:containerView];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    containerView.layer.sublayerTransform = perspective;
    CATransform3D transform = CATransform3DIdentity;
    for (int i = 0; i < 6; i ++) {
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"%i", i + 1];
        label.textAlignment = NSTextAlignmentCenter;
        [containerView addSubview:label];
        label.frame = CGRectMake(0, 0, 200, 200);
        label.center = CGPointMake(containerView.bounds.size.width/2, containerView.bounds.size.height/2);
        switch (i) {
            case 0:
            {
                label.backgroundColor = [UIColor whiteColor];
                transform = CATransform3DMakeTranslation(0, 0, 100);
                label.layer.transform = transform;
//                [self applyLightingToFace:label.layer];
                break;
            }
            case 1:
            {
                label.backgroundColor = [UIColor redColor];
                 transform = CATransform3DMakeTranslation(100, 0, 0);
                transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
                label.layer.transform = transform;
//                [self applyLightingToFace:label.layer];
                break;
            }
            case 2:
            {
                label.backgroundColor = [UIColor greenColor];
                 transform = CATransform3DMakeTranslation(0, -100, 0);
                transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
                label.layer.transform = transform;
//                [self applyLightingToFace:label.layer];
                break;
            }
            case 3:
            {
                label.backgroundColor = [UIColor purpleColor];
                 transform = CATransform3DMakeTranslation(0, 100, 0);
                transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
                label.layer.transform = transform;
//                [self applyLightingToFace:label.layer];
                break;
            }
            case 4:
            {
                label.backgroundColor = [UIColor orangeColor];
                 transform = CATransform3DMakeTranslation(-100, 0, 0);
                transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
                label.layer.transform = transform;
//                [self applyLightingToFace:label.layer];
                break;
            }
            case 5:
            {
                label.backgroundColor = [UIColor blackColor];
                 transform = CATransform3DMakeTranslation(0, 0, -100);
                transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
                label.layer.transform = transform;
//                [self applyLightingToFace:label.layer];
                break;
            }
            default:
                break;
        }
    }
}

- (void)applyLightingToFace:(CALayer *)face
{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换，感谢[@zihuyishi](https://github.com/zihuyishi)同学~
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    CGFloat dotProduct = GLKVector3DotProduct(light, normal);
    NSLog(@"%f", dotProduct);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
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

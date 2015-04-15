//
//  ScreenShotViewController.m
//  test4
//
//  Created by TangBo on 15/1/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "ScreenShotViewController.h"

@interface ScreenShotViewController ()

@end

@implementation ScreenShotViewController
{
    UIView *rotationView;
    CGFloat angle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 10, 1)];
//    view.backgroundColor = [UIColor redColor];
//    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
    imageView.image = [UIImage imageNamed:@"2"];
    [self.view addSubview:imageView];
//
//    rotationView = imageView;
//    
//    [NSTimer scheduledTimerWithTimeInterval: 0.01 target: self selector:@selector(transformAction) userInfo: nil repeats: YES];
    
//    UIImage *image = [self imageWithView:self.view];
//    NSLog(@"%@", image);
    /**
     UIVisualEffectView: ios8特性, 用来实现毛玻璃效果
     */
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    blurView.frame = self.view.bounds;
    
    [self.view addSubview:blurView];
}

- (void)transformAction {
    angle += 0.1;
    if (angle > M_PI * 2) {//大于 M_PI*2(360度) 角度再次从0开始
        angle = 0;
    }
    CGAffineTransform transform=CGAffineTransformMakeRotation(angle);
    rotationView.transform = transform;
}

- (UIImage *) imageWithView:(UIView *)view{
    UIImage *img;
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
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

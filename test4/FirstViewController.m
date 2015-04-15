//
//  FirstViewController.m
//  test4
//
//  Created by TangBo on 15/1/30.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "FirstViewController.h"
#import <objc/runtime.h>
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"退出" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, 100, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"打开相机" forState:UIControlStateNormal];
    btn2.frame = CGRectMake(0, 200, 100, 50);
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)btnClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)btn2Click:(id)sender
{
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setTitle:@"打开相册" forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor redColor];
//    btn.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
//    [btn addTarget:self action:@selector(openImageLibrary:) forControlEvents:UIControlEventTouchUpInside];
//    imgPicker.cameraOverlayView = btn;
    [self presentViewController:imgPicker animated:YES completion:nil];
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

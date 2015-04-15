//
//  TestImagePickerViewController.m
//  test4
//
//  Created by TangBo on 15/1/30.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestImagePickerViewController.h"
#import "FirstViewController.h"
@interface TestImagePickerViewController ()

@end

@implementation TestImagePickerViewController
{
    UIImagePickerController *_imgpicker;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"打开相机" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, 100, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn becomeFirstResponder];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick:(id)sender
{
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"打开相册" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    [btn addTarget:self action:@selector(openImageLibrary:) forControlEvents:UIControlEventTouchUpInside];
//    [imgPicker setShowsCameraControls:NO];
    [imgPicker.cameraOverlayView addSubview:btn];
    imgPicker.delegate = self;
//    imgPicker.cameraViewTransform = CGAffineTransformMakeScale(1, 320/426.0f);
    NSLog(@"%@", NSStringFromCGRect(imgPicker.navigationBar.frame));
    _imgpicker = imgPicker;
    [self presentViewController:imgPicker animated:YES completion:nil];
}

- (void)openImageLibrary:(id)sender
{
    FirstViewController *vc = [[FirstViewController alloc] init];
    [_imgpicker presentViewController:vc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *img = info[UIImagePickerControllerOriginalImage];
    NSLog(@"img size : %@", NSStringFromCGSize(img.size));
    NSValue *rect = info[UIImagePickerControllerCropRect];
    NSLog(@"rect : %@", rect);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [_imgpicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"开始摇动手机");
    NSLog(@"%i", motion);
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"stop");
    UIAlertView *yaoyiyao = [[UIAlertView alloc]initWithTitle:@"温馨提示：" message:@"您摇动了手机，想干嘛？" delegate:self cancelButtonTitle:@"CANCEL" otherButtonTitles: nil];
    [yaoyiyao show];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"取消");
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

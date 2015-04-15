//
//  ShowFilterImageViewController.m
//  test4
//
//  Created by TangBo on 15/2/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "ShowFilterImageViewController.h"
#import "MyImageView.h"
@interface ShowFilterImageViewController ()

@end

@implementation ShowFilterImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test1];
    [self test2];
}

- (void)test1
{
    UIImage *img = [UIImage imageNamed:@"2"];
    
    UIImageView *sourceImageView = [[UIImageView alloc] initWithImage:img];
    sourceImageView.frame = CGRectMake(10, 74, 342/2, 253/2);
    [self.view addSubview:sourceImageView];
    
    CIImage *inputImage = [img CIImage];
    if (!inputImage) {
        CGImageRef inputImageRef = [img CGImage];
        inputImage = [CIImage imageWithCGImage:inputImageRef];
        NSLog(@"CGImage");
    }
    
    CIFilter *monoFilter = [CIFilter filterWithName:@"CIColorMonochrome"];
    CIColor *color = [CIColor colorWithRed:0.76 green:0.65 blue:0.54];
    [monoFilter setValue:color forKey:@"inputColor"];
    [monoFilter setValue:@(1) forKey:@"inputIntensity"];
    [monoFilter setValue:inputImage forKey:kCIInputImageKey];
    
    CIFilter *vignetteFilter = [CIFilter filterWithName:@"CIVignette"];
    [vignetteFilter setValue:@(1.75) forKey:@"inputRadius"];
    [vignetteFilter setValue:@(1) forKey:@"inputIntensity"];
    [vignetteFilter setValue:monoFilter.outputImage forKey:@"inputImage"];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGRect rect = inputImage.extent;
    CGImageRef cgimage = [context createCGImage:monoFilter.outputImage fromRect:rect];
    UIImage *resultImg = [UIImage imageWithCGImage:cgimage];
    
    UIImageView *resultImageView = [[UIImageView alloc] initWithImage:resultImg];
    resultImageView.frame = CGRectMake(10, sourceImageView.frame.origin.y+sourceImageView.frame.size.height+10, 342/2, 253/2);
    [self.view addSubview:resultImageView];
}

- (void)test2
{
    UIImage *img = [UIImage imageNamed:@"2"];
    
    UIImageView *sourceImageView = [[UIImageView alloc] initWithImage:img];
    sourceImageView.frame = CGRectMake(10, 74, 342/2, 253/2);
    [self.view addSubview:sourceImageView];
    
    CIImage *inputImage = [img CIImage];
    if (!inputImage) {
        CGImageRef inputImageRef = [img CGImage];
        inputImage = [CIImage imageWithCGImage:inputImageRef];
        NSLog(@"CGImage");
    }
    
    CIFilter *monoFilter = [CIFilter filterWithName:@"CIColorMonochrome"];
    CIColor *color = [CIColor colorWithRed:0.76 green:0.65 blue:0.54];
    [monoFilter setValue:color forKey:@"inputColor"];
    [monoFilter setValue:@(1) forKey:@"inputIntensity"];
    [monoFilter setValue:inputImage forKey:kCIInputImageKey];
    
    CIFilter *vignetteFilter = [CIFilter filterWithName:@"CIVignette"];
    [vignetteFilter setValue:@(1.75) forKey:@"inputRadius"];
    [vignetteFilter setValue:@(1) forKey:@"inputIntensity"];
    [vignetteFilter setValue:monoFilter.outputImage forKey:@"inputImage"];
    
    MyImageView *imgView = [[MyImageView alloc] initWithFrame:CGRectMake(10, sourceImageView.frame.origin.y+sourceImageView.frame.size.height+10, 342/2, 253/2)];
    imgView.filter = vignetteFilter;
    imgView.inputImage = inputImage;
    [self.view addSubview:imgView];
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

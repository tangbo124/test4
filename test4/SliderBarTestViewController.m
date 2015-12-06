//
//  SliderBarTestViewController.m
//  test4
//
//  Created by tangbo on 15/8/18.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "SliderBarTestViewController.h"
#import "MySlider.h"

@interface SliderBarTestViewController ()

@end

@implementation SliderBarTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    MySlider *slider = [[MySlider alloc] initWithFrame:CGRectMake(10, 100, 300, 30)];
    slider.center = self.view.center;
    [slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

- (void)slider:(UISlider *)slider
{
//    NSLog(@"%f", slider.value);
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

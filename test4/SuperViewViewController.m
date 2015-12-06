//
//  SuperViewViewController.m
//  test4
//
//  Created by tangbo on 15/9/10.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "SuperViewViewController.h"
#import "Masonry.h"
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
@interface SuperViewViewController ()
@property (nonatomic, strong) UIScrollView *mainScrollView;
@end

@implementation SuperViewViewController
{
    UILabel *label;
    NSString *str;
    UIView *redView;
    UIView *greenView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    str = @"哈哈";
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.backgroundColor = [UIColor greenColor];
    [btn3 setTitle:@"增加字符串长度" forState:UIControlStateNormal];
    btn3.frame = CGRectMake(120, 100, 100, 100);
    [btn3 addTarget:self action:@selector(btn3Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];

    greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(250);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(200);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).offset(20);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
//    UIView *containerView = [UIView new];
//    containerView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:containerView];
//    
//    UILabel *label1 = [UILabel new];
//    label1.text = @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
//    label1.backgroundColor = [UIColor purpleColor];
//    [containerView addSubview:label1];
//    
//    UILabel *label2 = [UILabel new];
//    label2.text = @"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
//    label2.backgroundColor = [UIColor orangeColor];
//    [containerView addSubview:label2];
//    
//    UILabel *label3 = [UILabel new];
//    label3.text = @"cccccccccccccccccccccccccccccccccccccccc";
//    label3.backgroundColor = [UIColor cyanColor];
//    [containerView addSubview:label3];
//    
//    CGFloat width = 30.f;
//    
//    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.top.mas_equalTo(50);
//        make.height.mas_equalTo(100);
//    }];
//    
//    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.centerY.mas_equalTo(0);
//        make.width.mas_equalTo(width);
//    }];
//    
//    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(label1.mas_right);
//        make.centerY.mas_equalTo(0);
//        make.width.mas_equalTo(width);
//    }];
//    
//    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(width);
//        make.centerY.mas_equalTo(0);
//        make.left.equalTo(label2.mas_right);
//        make.right.mas_equalTo(0);
//    }];
}

- (void)btn3Click: (id)sender {
//    NSMutableString *mustr = [[NSMutableString alloc] initWithString:str];
//    [mustr appendString:@"哈哈哈哈"];
//    str = mustr.copy;
//    label.text = str;
//    
//    CGSize size = [redView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    NSLog(@"%@", NSStringFromCGSize(size));

    
    [UIView animateWithDuration:.1 animations:^{
        [redView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(greenView.mas_bottom).offset(10);
        }];
        [self.view layoutIfNeeded];
    }];
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

//
//  MasonryViewController.m
//  test4
//
//  Created by TangBo on 15/3/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MasonryViewController.h"
#import "Masonry.h"
@interface MasonryViewController ()

@end

@implementation MasonryViewController
{
    UIView *view1;
    UIView *view2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view2];

    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(100);
        make.top.mas_equalTo(100);
        make.size.sizeOffset(CGSizeMake(100, 50));
    }];

    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_trailing).offset(10);
        make.top.equalTo(view1.mas_bottom).offset(10);
        make.size.sizeOffset(CGSizeMake(100, 50));
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

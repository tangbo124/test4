//
//  CoreTextViewController.m
//  test4
//
//  Created by tangbo on 15/5/28.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "CoreTextViewController.h"
#import "Masonry.h"
#import "MyLabel.h"
#import "ClickLabel.h"

@interface CoreTextViewController ()

@end

@implementation CoreTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    MyLabel *label = [[MyLabel alloc] init];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(100);
    }];
     */
    
    ClickLabel *label = [ClickLabel new];
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(100);
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

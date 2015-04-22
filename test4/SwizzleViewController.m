//
//  SwizzleViewController.m
//  test4
//
//  Created by tangbo on 15/4/22.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "SwizzleViewController.h"
#import "UIViewController+Logging.h"
@implementation SwizzleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewdidappear 出现");
}

@end

//
//  ViewController.m
//  test4
//
//  Created by TangBo on 15/1/17.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    MyView *myView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    myView = [[MyView alloc] initWithFrame:CGRectZero];
    
    /**
     *  block作为参数传到方法里,不存在引用循环问题
     */
    [myView testBlock:^{
        NSLog(@"%@", myView);
        NSLog(@"%@", self);
    }];
    
    myView.myBlock = ^(){
        
        /**
         *  当myView是全局变量时,会出现引用循环问题
         */
        NSLog(@"%@", self);
        /**
         *  当myView是临时变量时, 会出现引用循环问题
         */
        NSLog(@"%@", myView);
    };
    
    NSLog(@"%@", NSStringFromCGSize(self.view.frame.size));
    
//    [self createUI];
//    return;
    UIView *fatherView = [[UIView alloc] init];
    fatherView.translatesAutoresizingMaskIntoConstraints=NO;
    fatherView.backgroundColor = [UIColor redColor];
    [self.view addSubview:fatherView];
//    自动布局代码
    UIButton *button=[[UIButton alloc]init];
    [button setTitle:@"点击一下" forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints=NO;
    [button setBackgroundColor:[UIColor blackColor]];
    [fatherView addSubview:button];
    
    NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[button(100)]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(200)]-15-|"options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)];
    
    NSArray *constraints3=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[fatherView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(fatherView)];
    
    NSArray *constraints4=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[fatherView]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(fatherView)];
    
    [NSLayoutConstraint activateConstraints:constraints2];
    [NSLayoutConstraint activateConstraints:constraints1];
    
    [NSLayoutConstraint activateConstraints:constraints3];
    [NSLayoutConstraint activateConstraints:constraints4];
    
    for (NSLayoutConstraint *con in fatherView.superview.constraints) {
        NSLog(@"");
        
        if (con.firstItem == fatherView) {
            NSLog(@"firstAttribute : %li", con.firstAttribute);
            NSLog(@"secondAttribute : %li", con.secondAttribute);
//            con.constant = 50;
        }
//        if (con.firstItem == button && con.firstAttribute == NSLayoutAttributeLeading) {
//            con.constant = 50;
//        }
//        if (con.secondItem == fatherView) {
//            NSLog(@"firstAttribute : %li", con.firstAttribute);
//            NSLog(@"secondAttribute : %li", con.secondAttribute);
////            con.constant = 100;
//        }
    }
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 20, 50, 50);
//    btn.backgroundColor = [UIColor greenColor];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}

- (void)btnClick:(id)sender
{
    NSLog(@"aaaaaaaaaaaaaaaa");
//    NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:button
//                                                           attribute:NSLayoutAttributeHeight
//                                                           relatedBy:NSLayoutRelationGreaterThanOrEqual
//                                                              toItem:nil
//                                                           attribute:NSLayoutAttributeNotAnAttribute
//                                                          multiplier:1
//                                                            constant:200];
//    
//    [NSLayoutConstraint activateConstraints:@[con]];
}

- (void)createUI
{
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor grayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, -30, self.tableView.frame.size.width, 30)];
    redView.backgroundColor = [UIColor redColor];
    [self.tableView addSubview:redView];
    
    self.dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i ++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"字符串%d", i]];
    }
    
    [self.tableView reloadData];
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSString *str = self.dataArray[indexPath.row];
    
    cell.textLabel.text = str;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 0, 20, 20);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:btn];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  MyTableViewViewController.m
//  test4
//
//  Created by tangbo on 15/4/14.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyTableViewViewController.h"
#import "ArrayDataSource.h"
#import "MyTableViewCell.h"
#import "UserModel.h"
#import "MyTableViewCell+ConfigCellWithUserModel.h"

static NSString * const indentifier = @"cell";

@interface MyTableViewViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) ArrayDataSource *dataSource;
@end

@implementation MyTableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 20; i ++) {
        UserModel *model = [[UserModel alloc] init];
        model.userName = [NSString stringWithFormat:@"我的名字是%i", i];
        [self.dataArray addObject:model];
    }
    
    ConfigureCellBlock configureBlock = ^(MyTableViewCell *cell, UserModel *model) {
        [cell configCellWithUserModel:model];
    };
    
    //ArrayDataSource必须声明称全局的属性， 不然在方法结束后会被释放掉, 导致崩溃
    self.dataSource = [[ArrayDataSource alloc] initWithItems:self.dataArray cellIndentifier:indentifier configureBlock:configureBlock];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:indentifier];
    
    [self.view addSubview:self.tableView];
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

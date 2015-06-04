//
//  TestLayoutSubviewsViewController.m
//  test4
//
//  Created by tangbo on 15/5/18.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestLayoutSubviewsViewController.h"
#import "MyCustomView.h"
#import "Masonry.h"
#import "TestLayoutsubViewsTableViewCell.h"
#import "CustomModel.h"
static NSString *reuseIdentifier = @"cell";

@interface TestLayoutSubviewsViewController ()
@property(nonatomic, strong) MyCustomView *customView;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation TestLayoutSubviewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.customView];
    
    [self.customView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    
    return;
    
    self.dataArray = [[NSMutableArray alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[TestLayoutsubViewsTableViewCell class] forCellReuseIdentifier:reuseIdentifier];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(50, 0, 0, 0));
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(10);
        make.size.sizeOffset(CGSizeMake(70, 30));
    }];
}

- (void)btnClick:(id)sender {
    for (int i = 0; i < 50; i ++) {
        CustomModel *model = [CustomModel new];
        model.name = @"啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestLayoutsubViewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    id model = self.dataArray[indexPath.row];
    [cell loadModel:model];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MyCustomView *)customView {
    if (!_customView) {
        _customView = [[MyCustomView alloc] init];
    }
    return _customView;
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

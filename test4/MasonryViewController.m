//
//  MasonryViewController.m
//  test4
//
//  Created by TangBo on 15/3/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MasonryViewController.h"
#import "Masonry.h"
#import "MasonryTableViewCell.h"

static NSString * const masonryCell = @"masonryCell";

@interface MasonryViewController ()
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *dataArray;
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
    self.dataArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 50; i ++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"%i", i]];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[MasonryTableViewCell class] forCellReuseIdentifier:masonryCell];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MasonryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:masonryCell forIndexPath:indexPath];
    [cell loadModel:self.dataArray[indexPath.row]];
    return cell;
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

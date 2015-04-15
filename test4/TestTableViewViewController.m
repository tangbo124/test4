//
//  TestTableViewViewController.m
//  test4
//
//  Created by TangBo on 15/1/28.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestTableViewViewController.h"

@interface TestTableViewViewController ()

@end

@implementation TestTableViewViewController
{
    UITableView *_tableView;
    NSMutableArray *dataArray;
    CGPoint lastPoint;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor greenColor];
//    _tableView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
    [self.view addSubview:_tableView];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, -80, self.view.frame.size.width, 80)];
    redView.backgroundColor = [UIColor redColor];
    [_tableView addSubview:redView];
    
    dataArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 20; i ++) {
        [dataArray addObject:@(i)];
    }
    [_tableView reloadData];
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSString *str = [dataArray[indexPath.row] stringValue];
    cell.textLabel.text = str;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    NSLog(@"contentoffset : %f", point.y);
    if (point.y <= -80) {
        if (!scrollView.isDragging) {
//            [UIView animateWithDuration:0.25f animations:^{
                scrollView.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
//                scrollView.contentOffset = CGPointMake(0, -80);
//            }];
        }
    }
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

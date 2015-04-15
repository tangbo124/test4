//
//  ToolBarViewController.m
//  test4
//
//  Created by tangbo on 15/4/15.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "ToolBarViewController.h"

static NSString * const identifier = @"cell";

@interface ToolBarViewController ()

@property(nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIToolbar *toolBar;
@property(nonatomic, assign) CGFloat lastOffsetY;
@end

@implementation ToolBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 50; i ++) {
        [_dataArray addObject:@(i)];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-49, self.view.bounds.size.width, 49)];
    self.toolBar.barStyle = UIBarStyleBlack;
    [self.view addSubview:self.toolBar];
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    NSNumber *text = (NSNumber *)_dataArray[indexPath.row];
    cell.textLabel.text = [text stringValue];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    BOOL resu = (_lastOffsetY < offsetY);
    _lastOffsetY = offsetY;
    if (resu) {
        NSLog(@"隐藏");
        NSLog(@"测试github");
        if (_toolBar.frame.origin.y == self.view.bounds.size.height) {
            return;
        }
        [UIView animateWithDuration:0.3f animations:^{
            CGRect frame = _toolBar.frame;
            frame.origin.y = self.view.bounds.size.height;
            _toolBar.frame = frame;
        } completion:^(BOOL finished) {
            
        }];
    }else {
        NSLog(@"显示");
        if (_toolBar.frame.origin.y == (self.view.bounds.size.height-49)) {
            return;
        }
        [UIView animateWithDuration:0.3f animations:^{
            CGRect frame = _toolBar.frame;
            frame.origin.y = self.view.bounds.size.height-49;
            _toolBar.frame = frame;
        } completion:^(BOOL finished) {
            
        }];
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

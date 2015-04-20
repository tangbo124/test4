//
//  AWTViewController.m
//  test4
//
//  Created by tangbo on 15/4/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "AWTViewController.h"
#import "AWTTableViewCell.h"

static NSString * const identifier = @"cell";

@interface AWTViewController ()

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic, strong) AWTTableViewCell *prototypeCell;
@end

@implementation AWTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self createUI];
}

- (void)createUI
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[AWTTableViewCell class] forCellReuseIdentifier:identifier];
    [self.view addSubview:self.tableView];
    
    NSArray *constranint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    NSArray *constranint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    [self.view addConstraints:constranint1];
    [self.view addConstraints:constranint2];
    
    _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
}

- (void)loadData
{
    self.dataArray = [[NSMutableArray alloc] init];
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"哈哈哈哈"];
    for (int i = 0; i < 10; i ++) {
        [str appendString:@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"];
        NSString *str2 = [[NSString alloc] initWithString:str];
        [self.dataArray addObject:str2];
    }
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AWTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    NSString *str = self.dataArray[indexPath.row];
    cell.nameLabel.text = str;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = self.dataArray[indexPath.row];
    _prototypeCell.nameLabel.text = str;
    CGSize size = [_prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"size : %@", NSStringFromCGSize(size));
    return size.height + 1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(void)didReceiveMemoryWarning {
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

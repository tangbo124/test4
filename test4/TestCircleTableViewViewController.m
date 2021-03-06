//
//  TestCircleTableViewViewController.m
//  test4
//
//  Created by tangbo on 15/5/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestCircleTableViewViewController.h"
#import "Masonry.h"
#import "CircleTableViewCell.h"
#import "UIScrollView+TestCircle.h"
static NSString *reuser = @"circleTableViewCell";

@interface TestCircleTableViewViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation TestCircleTableViewViewController
{
    CGRect tableBounds;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    tableBounds = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 200);
    _dataArray = @[@"1", @"2", @"1", @"2"];

    _tableView = [[UITableView alloc] initWithFrame:tableBounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuser];
    [self.view addSubview:_tableView];
    
    _tableView.pagingEnabled = YES;
    _tableView.backgroundColor = [UIColor redColor];
    
//    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(20);
//        make.left.mas_equalTo(10);
//        make.height.mas_equalTo(200);
//        make.width.mas_equalTo(200);
//    }];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if (UIDevice.currentDevice.systemVersion.floatValue >= 8.f)
    {
        // iOS 8 layout bug! Table's "height" taken from "width" after changing frame. But then if we cancel transform, set width/height to the final width/height, and rotate it and set to the virtual width/height - it works!
        
        CGRect rotatedFrame = tableBounds,
        unrotatedFrame = rotatedFrame;
        unrotatedFrame.size.width = rotatedFrame.size.height;
        unrotatedFrame.size.height = rotatedFrame.size.width;
        
        _tableView.transform = CGAffineTransformIdentity;
        _tableView.frame = unrotatedFrame;
        _tableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
        _tableView.frame = rotatedFrame;
    }
    else
    {
        _tableView.frame = tableBounds;
    }
}

- (void)testScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(100);
    }];
    
    _dataArray = @[@"1", @"2", @"1", @"2"];
    
    scrollView.pagingEnabled = YES;
    
    for (int i = 0; i < [_dataArray count]; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_dataArray[i]]];
        
        [scrollView addSubview:imgView];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, self.view.bounds.size.width * i, 0, self.view.bounds.size.width * ([_dataArray count] - i - 1)));
            
            make.size.sizeOffset(CGSizeMake(self.view.bounds.size.width, 300));
        }];
    }
    [scrollView enableCircle:YES];
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuser forIndexPath:indexPath];
    
//    NSString *imgUrl = _dataArray[indexPath.row];
//    cell.imgView.image = [UIImage imageNamed:imgUrl];
    cell.textLabel.text = @"aaaaaaaaaaaaaaaaa";
    cell.transform = CGAffineTransformMakeRotation(M_PI/2);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return self.view.bounds.size.width;
    return tableBounds.size.width;
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

//
//  SecondFilterViewController.m
//  test4
//
//  Created by TangBo on 15/2/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "SecondFilterViewController.h"
#import "ShowFilterImageViewController.h"
@interface SecondFilterViewController ()

@end

@implementation SecondFilterViewController
{
    NSArray *filterNames;
    CIFilter *selectedFilter;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-20) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];

    filterNames = [CIFilter filterNamesInCategory:self.selectedCategory];
    
    [tableView reloadData];
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return filterNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSString *filterName = filterNames[indexPath.row];
    CIFilter *filter = [CIFilter filterWithName:filterName];
    NSDictionary *dic = [filter attributes];
    NSString *categoryName = [dic valueForKey:kCIAttributeFilterName];
    cell.textLabel.text = categoryName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *filterName = filterNames[indexPath.row];
    CIFilter *filter = [CIFilter filterWithName:filterName];
    
    NSArray *inputArray = [filter inputKeys];
    for (NSString *str in inputArray) {
        NSString *value = [filter valueForKey:str];
        NSLog(@"%@=%@", str, value);
    }
    
    ShowFilterImageViewController *vc = [[ShowFilterImageViewController alloc] init];
    vc.selectedFilter = filter;
    [self.navigationController pushViewController:vc animated:YES];
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

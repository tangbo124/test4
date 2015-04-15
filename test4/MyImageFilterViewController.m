//
//  MyImageFilterViewController.m
//  test4
//
//  Created by TangBo on 15/2/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyImageFilterViewController.h"
#import "SecondFilterViewController.h"
@interface MyImageFilterViewController ()

@end

@implementation MyImageFilterViewController
{
    NSDictionary *categoryList;
    NSArray *categoryKeys;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-20) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    
    NSArray *array = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    NSLog(@"%@", array);
    
    categoryList = @{@"Blur": kCICategoryBlur,
                                   @"Color Adjustment": kCICategoryColorAdjustment,
                                   @"Color Effect": kCICategoryColorEffect,
                                   @"Composite": kCICategoryCompositeOperation,
                                   @"Distortion": kCICategoryDistortionEffect,
                                   @"Generator": kCICategoryGenerator,
                                   @"Geometry Adjustment": kCICategoryGeometryAdjustment,
                                   @"Gradient": kCICategoryGradient,
                                   @"Halftone Effect": kCICategoryHalftoneEffect,
                                   @"Sharpen": kCICategorySharpen,
                                   @"Stylize": kCICategoryStylize,
                                   @"Tile": kCICategoryTileEffect,
                                   @"Transition": kCICategoryTransition,
                                   };
    categoryKeys = [categoryList allKeys];
    [tableView reloadData];
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return categoryKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSString *filterName = categoryKeys[indexPath.row];
    cell.textLabel.text = filterName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selected = categoryKeys[indexPath.row];
    NSString *selectedCategory = [categoryList objectForKey:selected];
    SecondFilterViewController *vc = [[SecondFilterViewController alloc] init];
    vc.selectedCategory = selectedCategory;
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

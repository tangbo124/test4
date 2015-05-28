//
//  ArrayDataSource.m
//  test4
//
//  Created by tangbo on 15/4/14.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, copy) NSString *indentifier;
@property (nonatomic, copy) ConfigureCellBlock configureCellBlock;
@end

@implementation ArrayDataSource

- (instancetype)initWithItems:(NSArray *)dataSource cellIndentifier:(NSString *)indentifier configureBlock:(ConfigureCellBlock) configCellBlock
{
    self = [super init];
    if (self) {
        _dataSource = dataSource;
        _indentifier = indentifier;
        _configureCellBlock = configCellBlock;
    }
    return self;
}

#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_indentifier];
    id model = [self.dataSource objectAtIndex:indexPath.row];
    self.configureCellBlock(cell, model);
    return cell;
}
@end

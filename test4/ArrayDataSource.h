//
//  ArrayDataSource.h
//  test4
//
//  Created by tangbo on 15/4/14.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ConfigureCellBlock)(id cell, id model);

@interface ArrayDataSource : NSObject<UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)dataSource cellIndentifier:(NSString *)indentifier configureBlock:(ConfigureCellBlock) configCellBlock;
@end

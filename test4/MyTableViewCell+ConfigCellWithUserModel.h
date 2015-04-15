//
//  MyTableViewCell+ConfigCellWithUserModel.h
//  test4
//
//  Created by tangbo on 15/4/14.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyTableViewCell.h"

@class UserModel;

@interface MyTableViewCell (ConfigCellWithUserModel)
- (void)configCellWithUserModel:(UserModel *)model;
@end

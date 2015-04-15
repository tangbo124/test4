//
//  MyTableViewCell+ConfigCellWithUserModel.m
//  test4
//
//  Created by tangbo on 15/4/14.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyTableViewCell+ConfigCellWithUserModel.h"
#import "UserModel.h"

@implementation MyTableViewCell (ConfigCellWithUserModel)
- (void)configCellWithUserModel:(UserModel *)model
{
    self.nameLabel.text = model.userName;
}
@end

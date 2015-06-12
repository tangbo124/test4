//
//  MasonryTableViewCell.h
//  test4
//
//  Created by tangbo on 15/6/11.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasonryTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *label1;
@property(nonatomic, strong) UILabel *label2;

- (void)loadModel: (id)model;
@end

//
//  MyTableViewCell.m
//  test4
//
//  Created by tangbo on 15/4/14.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI
{
    self.nameLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
    self.nameLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.nameLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

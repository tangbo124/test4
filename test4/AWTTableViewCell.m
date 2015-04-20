//
//  AWTTableViewCell.m
//  test4
//
//  Created by tangbo on 15/4/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "AWTTableViewCell.h"

@implementation AWTTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.numberOfLines = 0;
    self.nameLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.nameLabel];
    /*
     *UILabel的宽度必须固定, 高度任意
     */
    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_nameLabel(200)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_nameLabel)];
    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_nameLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_nameLabel)];
    [self.contentView addConstraints:constraint1];
    [self.contentView addConstraints:constraint2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

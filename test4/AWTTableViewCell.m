//
//  AWTTableViewCell.m
//  test4
//
//  Created by tangbo on 15/4/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "AWTTableViewCell.h"
#import "Masonry.h"

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
//    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.numberOfLines = 0;
    //必须加preferredMaxLayoutWidth
    self.nameLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
    self.nameLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.nameLabel];
    
//    NSArray *constraint1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_nameLabel]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_nameLabel)];
//    NSArray *constraint2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_nameLabel]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_nameLabel)];
//    [self.contentView addConstraints:constraint1];
//    [self.contentView addConstraints:constraint2];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
//    [self.nameLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

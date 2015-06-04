//
//  TestLayoutsubViewsTableViewCell.m
//  test4
//
//  Created by tangbo on 15/5/19.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestLayoutsubViewsTableViewCell.h"
#import "Masonry.h"
#import "CustomModel.h"

@implementation TestLayoutsubViewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor redColor];
        
    }
    return self;
}

- (void)loadModel:(id)model {
    CustomModel *cmodel = (CustomModel *)model;
    self.titleLabel.text = cmodel.name;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
//    NSLog(@"调用了layoutsubviews: %@", self);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

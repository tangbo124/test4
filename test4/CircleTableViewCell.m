//
//  CircleTableViewCell.m
//  test4
//
//  Created by tangbo on 15/5/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "CircleTableViewCell.h"
#import "Masonry.h"

@implementation CircleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imgView = [[UIImageView alloc] init];
        _imgView.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _imgView.frame = CGRectMake(0, 0, 375, 300);
    
    [self.contentView addSubview:self.imgView];
//    CGSize size = self.contentView.frame.size;
    
//    _imgView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
//    NSLog(@"size: %@", NSStringFromCGSize(size));
//    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
//        make.left.and.top.mas_equalTo(0);
//        make.size.sizeOffset(CGSizeMake(size.width, size.height));
//    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

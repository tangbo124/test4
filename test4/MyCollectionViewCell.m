//
//  MyCollectionViewCell.m
//  test4
//
//  Created by tangbo on 15/8/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        _nameLabel.center = self.contentView.center;
        _nameLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_nameLabel];
    }
    return self;
}

@end

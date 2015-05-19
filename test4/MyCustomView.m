//
//  MyCustomView.m
//  test4
//
//  Created by tangbo on 15/5/18.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyCustomView.h"
#import "Masonry.h"
@implementation MyCustomView
- (instancetype)init
{
    self = [super init];
    if (self) {
        _firstLabel = [[UILabel alloc] init];
        _firstLabel.backgroundColor = [UIColor redColor];
        
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:_firstLabel];
    [self addSubview:_secondLabel];
    
    [_firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.equalTo(_secondLabel.mas_top);
        make.height.equalTo(_secondLabel.mas_height);
    }];
    
    [_secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(_firstLabel.mas_bottom);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.equalTo(_firstLabel.mas_height);
    }];

    NSLog(@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
}
@end

//
//  MasonryTableViewCell.m
//  test4
//
//  Created by tangbo on 15/6/11.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MasonryTableViewCell.h"
#import "Masonry.h"

@interface MasonryTableViewCell ()
@property (nonatomic, strong) MASConstraint *cons1;
@property (nonatomic, strong) MASConstraint *cons2;
@end
@implementation MasonryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label1 = [UILabel new];
        _label1.backgroundColor = [UIColor redColor];
        
        _label2 = [UILabel new];
        _label2.backgroundColor = [UIColor greenColor];

        [self.contentView addSubview:_label1];
        
        [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            /*
             *(1)  在使用优先级时, 必须指定某一个约束的优先级是UILayoutPriorityRequired, 否则会crash
             *(2)  由于UILabel在自动布局下会有内容吸附的作用, 也就是会根据内容计算自身的大小, 所以在给UILabel加约束时, 如果当前约束的优先级是UILayoutPriorityDefaultLow, 就会不起作用, UILabel自适应大小
            */
            _cons1 = make.left.mas_equalTo(0).priority(UILayoutPriorityRequired);
            _cons2 = make.left.mas_equalTo(100).priority(UILayoutPriorityDefaultHigh);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
        }];
    }
    return self;
}

- (void)loadModel: (id)model {
    
    _label1.text = model;
    
    if ([model isEqualToString:@"0"]) {
        [_cons1 install];
        [_cons2 uninstall];
    }else {
        [_cons1 uninstall];
        [_cons2 install];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

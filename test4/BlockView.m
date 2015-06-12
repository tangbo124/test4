//
//  BlockView.m
//  test4
//
//  Created by tangbo on 15/6/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "BlockView.h"

@implementation BlockView
{
    UILabel *label;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        label.text = @"点我啊";
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)];
        [label addGestureRecognizer:tap];
        [self addSubview:label];
    }
    return self;
}

- (void)labelClick:(UIGestureRecognizer *)g {
    if (self.block) {
        self.block();
    }
}
- (void)dealloc {
    NSLog(@"blockView 被释放了");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

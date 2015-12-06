//
//  MySlider.m
//  test4
//
//  Created by tangbo on 15/8/18.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MySlider.h"

@implementation MySlider

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.minimumTrackTintColor = [UIColor greenColor];
        self.maximumTrackTintColor = [UIColor blackColor];
//        [self setThumbTintColor:[UIColor purpleColor]];
        [self setThumbImage:[UIImage imageNamed:@"slider"] forState:UIControlStateNormal];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
 改变滑动条的位置以及宽高
*/
- (CGRect)trackRectForBounds:(CGRect)bounds
{
    return CGRectMake(0, 0, bounds.size.width, 5);
}
/*
 *改变滑竿的位置以及大小
 */
- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{
    CGRect thumbBounds = [super thumbRectForBounds:CGRectMake(100, 200, bounds.size.width, bounds.size.height) trackRect:rect value:value];
    return CGRectMake(thumbBounds.origin.x, thumbBounds.origin.y+10, thumbBounds.size.width, thumbBounds.size.height);
}
@end

//
//  UIScrollView+Circle.m
//  test4
//
//  Created by TangBo on 15/1/27.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "UIScrollView+Circle.h"
#import <objc/runtime.h>

static char CircleDataArrayKey;

@implementation UIScrollView (Circle)

- (void)setCircleDataArray:(NSMutableArray *)circleDataArray
{
    if (circleDataArray.count <= 2) {
        return;
    }
    objc_setAssociatedObject(self, &CircleDataArrayKey, circleDataArray, OBJC_ASSOCIATION_RETAIN);
    [self enabledCircle];
}
- (NSMutableArray *)circleDataArray
{
    NSMutableArray *associatedObject = (NSMutableArray *)objc_getAssociatedObject(self, &CircleDataArrayKey);
    return associatedObject;
}

- (void)enabledCircle
{
    self.contentOffset = CGPointMake(self.frame.size.width, 0);
    self.pagingEnabled = YES;
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint point = self.contentOffset;
        CGFloat pageWidth = self.frame.size.width;
        //这个if语句用来模拟- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView代理方法
        if (point.x <= 0 || point.x >= pageWidth * 2) {
            int page = floor((point.x - pageWidth / 2) / pageWidth) + 1;
            if(page == 1) {//代表当前没有滑动, 保持在当前页
                return;
            } else if (page == 0) {//代表手指向右滑动
                [self pageMoveToRight];
            } else {//代表手指向左滑动
                [self pageMoveToLeft];
            }
            CGPoint p = CGPointZero;
            p.x = pageWidth;
            [self setContentOffset:p animated:NO];
        }
    }
}

//把数组的最后一个元素移动到前面
- (void)pageMoveToRight {
    NSMutableArray *array = self.circleDataArray;
    NSInteger count = array.count;
    UIView *tempView = [array lastObject];
    for (NSInteger i = count-2; i >= 0; i --) {
        array[i + 1] = array[i];
    }
    array[0] = tempView;
    [self setPageFrame];
}

//把数组的第一个元素移动到最后
- (void)pageMoveToLeft {
    NSMutableArray *array = self.circleDataArray;
    NSInteger count = array.count;
    UIView *tempView = array[0];
    for (NSInteger i = 1; i < count; i ++) {
        array[i - 1] = array[i];
    }
    array[count - 1] = tempView;
    [self setPageFrame];
}

//重新设置数组里面元素的frame, 永远保持当前显示的是第二个
- (void)setPageFrame
{
    NSMutableArray *array = self.circleDataArray;
    NSInteger count = array.count;
    for (int i = 0; i < count; i ++) {
        CGFloat w = self.frame.size.width;
        CGFloat h = self.frame.size.height;
        CGFloat x = i * w;
        CGFloat y = 0;
        UIView *view = array[i];
        view.frame = CGRectMake(x, y, w, h);
    }
}
@end

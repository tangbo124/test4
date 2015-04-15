//
//  UIScrollView+Circle.h
//  test4
//
//  Created by TangBo on 15/1/27.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  循环滚动的UIScrollView, 原理是通过移动UIScrollView里面的subview的frame, 来保持当前永远显示的第二个子View,
 *  要是想加上UIPageControl, 可以通过判断circleDataArray数组中第二个元素的tag值来判断当前显示的是第几页
 */
@interface UIScrollView (Circle)

@property(nonatomic, strong) NSMutableArray *circleDataArray;

@end

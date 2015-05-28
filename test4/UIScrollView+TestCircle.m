//
//  UIScrollView+TestCircle.m
//  test4
//
//  Created by tangbo on 15/5/21.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "UIScrollView+TestCircle.h"
#import <objc/runtime.h>

static char CircleEnabledKey;

@interface UIScrollView ()

@property(nonatomic, assign) BOOL enableCircle;

@end

@implementation UIScrollView (TestCircle)

- (void)setEnableCircle:(BOOL)enableCircle {
    objc_setAssociatedObject(self, &CircleEnabledKey, [NSNumber numberWithBool:enableCircle], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)enableCircle {
    return (BOOL)objc_getAssociatedObject(self, &CircleEnabledKey);
}

- (void)enableCircle:(BOOL)enabled {
    self.enableCircle = enabled;
    if (enabled) {
        self.contentOffset = CGPointMake(self.frame.size.width, 0);
        self.pagingEnabled = YES;
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.enableCircle) {
        return;
    }
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint point = self.contentOffset;
        CGFloat pageWidth = self.frame.size.width;
        CGPoint p = CGPointZero;
        if (point.x == 0) {
            p.x = self.contentSize.width - pageWidth*2;
            [self setContentOffset:p animated:NO];
        }else if (point.x == self.contentSize.width - pageWidth) {
            p.x = pageWidth;
            [self setContentOffset:p animated:NO];
        }
    }
}
@end

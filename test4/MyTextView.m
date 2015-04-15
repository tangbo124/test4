//
//  MyTextView.m
//  test4
//
//  Created by TangBo on 15/2/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyTextView.h"

@implementation MyTextView
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    NSInteger index = [self.layoutManager characterIndexForPoint:touchPoint inTextContainer:self.textContainer fractionOfDistanceBetweenInsertionPoints:0];
    id str = [self.attributedText attribute:NSTextEffectAttributeName atIndex:index effectiveRange:nil];
    
    NSLog(@"str : %@", str);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

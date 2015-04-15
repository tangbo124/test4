//
//  MyTextAttachment.m
//  test4
//
//  Created by TangBo on 15/2/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyTextAttachment.h"

@implementation MyTextAttachment

/**
 *  用来保证图文混排时,图片的大小随文字的字体大小变化而变化
 *
 */
- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex
{
    NSLog(@"cgrect : %@", NSStringFromCGRect(lineFrag));
    //返回的是UITextView中的图片的宽高
    return CGRectMake(0, 0, lineFrag.size.height, lineFrag.size.height);
}
@end

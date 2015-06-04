//
//  MyLabel.m
//  test4
//
//  Created by tangbo on 15/5/28.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyLabel.h"
#import "CoreTextTools.h"

@implementation MyLabel

/**
 *简单的利用coreText进行文字渲染
 */
-(void)characterAttribute
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGMutablePathRef path = CGPathCreateMutable(); //1
    CGPathAddRect(path, NULL, self.bounds);
    
    NSMutableAttributedString *mabstring = [[NSMutableAttributedString alloc]initWithString:@"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"]; //2
    [mabstring addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:NSMakeRange(0, mabstring.length)];
    [mabstring addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, mabstring.length)];
    //换行模式
    CTParagraphStyleSetting lineBreakMode;
    CTLineBreakMode lineBreak = kCTLineBreakByTruncatingTail;
    lineBreakMode.spec = kCTParagraphStyleSpecifierLineBreakMode;
    lineBreakMode.value = &lineBreak;
    lineBreakMode.valueSize = sizeof(CTLineBreakMode);
    CTParagraphStyleSetting settings[] = {lineBreakMode};
     CTParagraphStyleRef style = CTParagraphStyleCreate(settings, 1);
    [mabstring addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)(style) range:NSMakeRange(0, mabstring.length)];
    
    /*设置空心字样式
     long number = 2;
     CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
     [mabstring addAttribute:(id)kCTStrokeWidthAttributeName value:(__bridge id)num range:NSMakeRange(10, 4)];
     */
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mabstring); //3
    CTFrameRef frame =
    CTFramesetterCreateFrame(framesetter,
                             CFRangeMake(0, 0), path, NULL);
    
    CTFrameDraw(frame, context); //4
    CFRelease(style);
    CFRelease(frame); //5
    CFRelease(framesetter);
    CFRelease(path);
}

/**
 *图文混排
 */
- (void)drawTextWithImage {
    CGContextRef contxt = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(contxt, CGAffineTransformIdentity);
    CGContextTranslateCTM(contxt, 0, self.bounds.size.height);
    CGContextScaleCTM(contxt, 1.0, -1.0);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"aaaasaasfsdfldsfds" ];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, [attributedString length])];

    //创建图片位置
    NSString *imageName = @"1";
    NSDictionary *fileAttr = [NSDictionary dictionaryWithObjectsAndKeys:@(50), @"width", @(50), @"height", nil];
    NSMutableAttributedString *imageAttributedString = [CoreTextTools configWithImageFileName:imageName imageAttr:fileAttr];
    [attributedString insertAttributedString:imageAttributedString atIndex:3];//把attribute 插入到一个特定的位置
    //创建图片位置至此完成那个
    
    CTFramesetterRef ctFrameSetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)attributedString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    CTFrameRef ctFrame = CTFramesetterCreateFrame(ctFrameSetter, CFRangeMake(0, 0), path, NULL);
    CTFrameDraw(ctFrame, contxt);
    
    //现在开始画图片
    CFArrayRef lines = CTFrameGetLines(ctFrame);
    CFIndex lineCount = CFArrayGetCount(lines);
    CGPoint lineOrigins [lineCount];
    CTFrameGetLineOrigins(ctFrame, CFRangeMake(0, 0), lineOrigins);
    
    for (int i = 0; i < lineCount; i++) {
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CGFloat lineAscent;
        CGFloat lineDescent;
        CGFloat lineLeading;
        CTLineGetTypographicBounds(line, &lineAscent, &lineDescent, &lineLeading);
        
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        CFIndex runCount = CFArrayGetCount(runs);
        for (int j = 0; j < runCount; j++) {
            CGFloat runAscent;
            CGFloat runDescent;
            CGPoint lineOrigin = lineOrigins[i];
            CTRunRef run = CFArrayGetValueAtIndex(runs, j);
            NSDictionary* attributes = (NSDictionary*)CTRunGetAttributes(run);
            CGRect runRect;
            runRect.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0,0), &runAscent, &runDescent, NULL);
            
            runRect=CGRectMake(lineOrigin.x + CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL), lineOrigin.y - runDescent, runRect.size.width, runAscent + runDescent);
            
            NSString *imageName = [attributes objectForKey:@"imageName"];
            //图片渲染逻辑
            if (imageName)
            {
                UIImage *image = [UIImage imageNamed:imageName];
                if (image)
                {
                    CGContextDrawImage(contxt, runRect, image.CGImage);
                }
            }
        }
    }
    
    //画图片结束
    
    CFRelease(ctFrame);
    CFRelease(path);
    CFRelease(ctFrameSetter);
}

/**
 *一行一行的绘制
 */
- (void)drawWithLine {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    NSMutableAttributedString *mabstring = [[NSMutableAttributedString alloc]initWithString:@"aaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbccccccccccccccdddddddddddddeeeeeeeeeeeeeeeeeeeffffffffffffffffffgggggggggggggghhhhhhhhhhh"];
    [mabstring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, mabstring.length)];
    [mabstring addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, mabstring.length)];
    
    [mabstring addAttribute:(NSString*)(kCTStrokeColorAttributeName) value:(__bridge id)[[UIColor whiteColor]CGColor] range:NSMakeRange(0,[mabstring length])];
    
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mabstring);
    CGMutablePathRef path = CGPathCreateMutable(); //1
    CGPathAddRect(path, NULL, self.bounds);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFArrayRef lines = CTFrameGetLines(frame);
    CFIndex lineCount = CFArrayGetCount(lines);
    CGPoint lineOrigins[lineCount];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), lineOrigins);
    for (int i = 0; i < lineCount; i ++) {
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CGPoint lineOrigin = lineOrigins[i];
        CGContextSetTextPosition(context, lineOrigin.x, lineOrigin.y);//在偏移量x,y上打印
        CTLineDraw(line, context);//draw 行文字
    }
    CFRelease(path);
    CFRelease(frame);
    CFRelease(framesetter);
}

/**
 *按行绘制, 当文字太多时, 显示省略号
 */
- (void)drawWithManyWords {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    NSMutableAttributedString *mabstring = [[NSMutableAttributedString alloc]initWithString:@"aaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbb中国ccccccccdddd你大爷的eeeeeeeeeeeeeeeffffffffffffffffff你好"];
    [mabstring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, mabstring.length)];
    [mabstring addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, mabstring.length)];
    //换行模式, 以单词为单位换行
    CTParagraphStyleSetting lineBreakMode;
    CTLineBreakMode lineBreak = kCTLineBreakByCharWrapping;
    lineBreakMode.spec = kCTParagraphStyleSpecifierLineBreakMode;
    lineBreakMode.value = &lineBreak;
    lineBreakMode.valueSize = sizeof(CTLineBreakMode);
    CTParagraphStyleSetting settings[] = {lineBreakMode};
    CTParagraphStyleRef style = CTParagraphStyleCreate(settings, 1);
    [mabstring addAttribute:(id)kCTParagraphStyleAttributeName value:(__bridge id)(style) range:NSMakeRange(0, mabstring.length)];
    
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mabstring);
    CGMutablePathRef path = CGPathCreateMutable(); //1
    CGPathAddRect(path, NULL, self.bounds);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFArrayRef lines = CTFrameGetLines(frame);
    CFIndex lineCount = CFArrayGetCount(lines);
    CGPoint lineOrigins[lineCount];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), lineOrigins);
    for (int i = 0; i < lineCount; i ++) {
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CGPoint lineOrigin = lineOrigins[i];
        CGContextSetTextPosition(context, lineOrigin.x, lineOrigin.y);//在偏移量x,y上打印
        BOOL shouldDrawLine = YES;
        if (i == lineCount - 1) {//判断当前是否是最后一行
            CFRange lastLineRange = CTLineGetStringRange(line);//得到最后一行的位置以及长度
            //判断是否需要加省略号
            if (lastLineRange.location + lastLineRange.length < (CFIndex)mabstring.length) {
                CTLineTruncationType truncationType = kCTLineTruncationEnd;//换行模式
                NSUInteger truncationAttributePosition = lastLineRange.location + lastLineRange.length - 1;
                
                NSDictionary *tokenAttributes = [mabstring attributesAtIndex:truncationAttributePosition
                                                                     effectiveRange:NULL];
                NSString *truncationTokenString = @"\u2026";//省略号
                NSAttributedString *tokenString = [[NSAttributedString alloc] initWithString:truncationTokenString
                                                                                  attributes:tokenAttributes];
                CTLineRef truncationToken = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)tokenString);
                
                //获取最后一行的字符串
                NSMutableAttributedString *truncationString = [[mabstring attributedSubstringFromRange:NSMakeRange(lastLineRange.location, lastLineRange.length)] mutableCopy];
                if (lastLineRange.length > 0) {
                    //最后一行的最后一个字符如果是空格, 删掉空格
                    unichar lastCharacter = [[truncationString string] characterAtIndex:lastLineRange.length - 1];
                    if ([[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:lastCharacter]) {
                        [truncationString deleteCharactersInRange:NSMakeRange(lastLineRange.length - 1, 1)];
                    }
                }
                //拼接省略号, 使最后一行的字符不能在一行显示
                [truncationString appendAttributedString:tokenString];
                
                CTLineRef truncationLine = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)truncationString);
                //生成带省略号的新行
                CTLineRef truncatedLine = CTLineCreateTruncatedLine(truncationLine, self.bounds.size.width, truncationType, truncationToken);
                if (!truncatedLine) {
                    // If the line is not as wide as the truncationToken, truncatedLine is NULL
                    truncatedLine = CFRetain(truncationToken);
                }
                CTLineDraw(truncatedLine, context);
                CFRelease(truncatedLine);
                CFRelease(truncationLine);
                CFRelease(truncationToken);
                shouldDrawLine = NO;
            }
        }
        if (shouldDrawLine) {
            CTLineDraw(line, context);//draw 行文字
        }
    }
    CFRelease(path);
    CFRelease(frame);
    CFRelease(framesetter);
}

/**
 *文字环绕圆圈
 */
- (void)drawTextWrapRect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Flip the coordinate system
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // Create a path to render text in
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds );
    
    // An attributed string containing the text to render
    NSAttributedString* attString = [[NSAttributedString alloc]
                                     initWithString:@"abcdefgaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"];
    
    // Create a path to wrap around
    CGMutablePathRef clipPath = CGPathCreateMutable();
    CGPathAddEllipseInRect(clipPath, NULL, CGRectMake(100, 0, 100, 100) );
    
    /*****************给圆圈加个颜色, 删除也没有问题*******************/
    CGContextAddPath(context, clipPath);
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(context, 1);
    CGContextStrokePath(context);
    /**************************************************************/
    
    // A CFDictionary containing the clipping path
    CFStringRef keys[] = { kCTFramePathClippingPathAttributeName };
    CFTypeRef values[] = { clipPath };
    CFDictionaryRef clippingPathDict = CFDictionaryCreate(NULL,
                                                          (const void **)&keys, (const void **)&values,
                                                          sizeof(keys) / sizeof(keys[0]),
                                                          &kCFTypeDictionaryKeyCallBacks,
                                                          &kCFTypeDictionaryValueCallBacks);
    
    // An array of clipping paths -- you can use more than one if needed!
    NSArray *clippingPaths = [NSArray arrayWithObject:(__bridge NSDictionary*)clippingPathDict];
    // Create an options dictionary, to pass in to CTFramesetter
    NSDictionary *optionsDict = [NSDictionary dictionaryWithObject:clippingPaths forKey:(NSString*)kCTFrameClippingPathsAttributeName];
    
    // Finally create the framesetter and render text
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString); //3
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,
                                                CFRangeMake(0, 0), path, (__bridge CFDictionaryRef)optionsDict);
    
    CTFrameDraw(frame, context);
    // Clean up
    CFRelease(frame);
    CFRelease(framesetter);
    CFRelease(clippingPathDict);
    CFRelease(clipPath);
    CFRelease(path);
}

/**
 *文字环绕图片
 */
- (void)drawTextWrapImage {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Flip the coordinate system
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // Create a path to render text in
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds );
    
    // An attributed string containing the text to render
    NSMutableAttributedString* attString = [[NSMutableAttributedString alloc]
                                            initWithString:@"这是一个文字环绕图片的示例, 这是一个文字环绕图片的示例, 这是一个文字环绕图片的示例, 这是一个文字环绕图片的示例, 这是一个文字环绕图片的示例, 这是一个文字环绕图片的示例, 这是一个文字环绕图片的示例, 这是一个文字环绕图片的示例, 这是一个文字环绕图片的示例"];
    
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, attString.length)];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:NSMakeRange(0, attString.length)];
    CGRect rect = CGRectMake(16, 0, 100, 100);
    // Create a path to wrap around
    CGMutablePathRef clipPath = CGPathCreateMutable();
    //在图片的位置画个矩形
    CGPathAddRect(clipPath, NULL, rect );
    UIImage *image = [UIImage imageNamed:@"1"];
    //画上图片
    CGContextDrawImage(context, rect, image.CGImage);
    
    // A CFDictionary containing the clipping path
    CFStringRef keys[] = { kCTFramePathClippingPathAttributeName };
    CFTypeRef values[] = { clipPath };
    CFDictionaryRef clippingPathDict = CFDictionaryCreate(NULL,
                                                          (const void **)&keys, (const void **)&values,
                                                          sizeof(keys) / sizeof(keys[0]),
                                                          &kCFTypeDictionaryKeyCallBacks,
                                                          &kCFTypeDictionaryValueCallBacks);
    
    // An array of clipping paths -- you can use more than one if needed!
    NSArray *clippingPaths = [NSArray arrayWithObject:(__bridge NSDictionary*)clippingPathDict];
    // Create an options dictionary, to pass in to CTFramesetter
    NSDictionary *optionsDict = [NSDictionary dictionaryWithObject:clippingPaths forKey:(NSString*)kCTFrameClippingPathsAttributeName];
    
    // Finally create the framesetter and render text
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString); //3
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,
                                                CFRangeMake(0, 0), path, (__bridge CFDictionaryRef)optionsDict);
    
    CTFrameDraw(frame, context);
    // Clean up
    CFRelease(frame);
    CFRelease(framesetter);
    CFRelease(clippingPathDict);
    CFRelease(clipPath);
    CFRelease(path);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    [self characterAttribute];
    [self drawTextWithImage];
//    [self drawWithLine];
//    [self drawWithManyWords];
//    [self drawTextWrapRect];
//    [self drawTextWrapImage];
}

@end

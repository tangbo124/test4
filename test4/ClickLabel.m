//
//  ClickLabel.m
//  test4
//
//  Created by tangbo on 15/6/1.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "ClickLabel.h"
#import <CoreText/CoreText.h>

@implementation ClickLabel
{
    NSMutableDictionary *_clickDic;
    NSRange highLightRange;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _clickDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [_clickDic removeAllObjects];
    //查找链接地址的正则表达式
    NSString* expression = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    NSString *string = @"aaaaahttp://www.baidu.comabcd你豪你你你http://www.baidu.com豪你豪你好你好你好http://www.sina.com";
    
    NSRegularExpression* regular = [NSRegularExpression regularExpressionWithPattern:expression options:0 error:nil];
    NSRange range = NSMakeRange(0, string.length);
    __block NSRange lastRange = NSMakeRange(0, 0);
    NSMutableAttributedString *mstr = [[NSMutableAttributedString alloc] init];
    [regular enumerateMatchesInString:string options:0 range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        NSRange matchRange = result.range;
        NSString *url = [string substringWithRange:matchRange];
        
        NSRange subRange = NSMakeRange(lastRange.location+lastRange.length, matchRange.location-lastRange.location-lastRange.length);
        if (subRange.length) {
            NSString *commonStr = [string substringWithRange:subRange];
            [mstr appendAttributedString:[[NSAttributedString alloc] initWithString:commonStr]];
        }
        
         NSMutableAttributedString *urlAttr = [[NSMutableAttributedString alloc] initWithString:url];
        
        [urlAttr addAttribute:@"url" value:url range:NSMakeRange(0, urlAttr.length)];
        
        [mstr appendAttributedString:urlAttr];
        
        if (highLightRange.location >= matchRange.location && highLightRange.length + highLightRange.location <= matchRange.length + matchRange.location) {
            [mstr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:matchRange];
        } else {
            [mstr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:matchRange];
        }
        lastRange = matchRange;
    }];
    
    if (lastRange.location + lastRange.length < string.length) {
        NSString *substr = [string substringWithRange:NSMakeRange(lastRange.location+lastRange.length, string.length-lastRange.location-lastRange.length)];
        [mstr appendAttributedString:[[NSAttributedString alloc] initWithString:substr]];
    }
    
    CGContextRef contxt = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(contxt, CGAffineTransformIdentity);
    CGContextTranslateCTM(contxt, 0, self.bounds.size.height);
    CGContextScaleCTM(contxt, 1.0, -1.0);
    UIFont *font = [UIFont systemFontOfSize:16];
    [mstr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [mstr length])];

    CTFramesetterRef ctFrameSetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)mstr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    
    CTFrameRef ctFrame = CTFramesetterCreateFrame(ctFrameSetter, CFRangeMake(0, 0), path, NULL);
    CTFrameDraw(ctFrame, contxt);
    
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
        CGPoint lineOrigin = lineOrigins[i];
        for (int j = 0; j < runCount; j++) {
            CGFloat runAscent;
            CGFloat runDescent;
            CTRunRef run = CFArrayGetValueAtIndex(runs, j);
            NSDictionary* attributes = (NSDictionary*)CTRunGetAttributes(run);
            NSString *url = [attributes objectForKey:@"url"];
            if (url) {
                CGRect runRect;
                runRect.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0,0), &runAscent, &runDescent, NULL);
                CFRange urlRange = CTRunGetStringRange(run);
                float offset = CTLineGetOffsetForStringIndex(line, urlRange.location, NULL);
                float height = runAscent;
                float y = lineOrigin.y - lineDescent - font.descender;
                runRect=CGRectMake(lineOrigin.x + offset, (self.bounds.size.height+5)-y-height+runDescent/2, runRect.size.width, height);
                NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:url, @"url", [NSValue valueWithCGRect:runRect], @"rect", nil];
                NSRange nrange = NSMakeRange(urlRange.location, urlRange.length);
                [_clickDic setObject:dic forKey:NSStringFromRange(nrange)];
            }
        }
    }
    
    CFRelease(ctFrame);
    CFRelease(path);
    CFRelease(ctFrameSetter);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    for (NSString *key in _clickDic.allKeys) {
        NSDictionary *dic = [_clickDic objectForKey:key];
        CGRect rect = [dic[@"rect"] CGRectValue];
        NSString *url = dic[@"url"];
        if (CGRectContainsPoint(rect, location)) {
            NSRange range = NSRangeFromString(key);
            highLightRange = range;
//            NSLog(@"%@", key);
            NSLog(@"url : %@", url);
            [self setNeedsDisplay];
        }
    }
}

@end

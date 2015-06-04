//
//  CoreTextTools.m
//  test4
//
//  Created by tangbo on 15/6/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "CoreTextTools.h"

@implementation CoreTextTools


+ (CGSize)fitWithSize: (CGSize)size framesetter: (CTFramesetterRef)framesetter {
    CGSize fitSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), NULL, size, NULL);
    return fitSize;
}

+ (CTFramesetterRef)configWithText: (NSString *)string emoji: (NSDictionary *)emojiDic {
    NSString* expression = @"(\\[\\w+\\])";
    NSRegularExpression* regular = [NSRegularExpression regularExpressionWithPattern:expression options:0 error:nil];
    NSRange range = NSMakeRange(0, string.length);
    __block NSRange lastRange = NSMakeRange(0, 0);
    NSMutableAttributedString *mstr = [[NSMutableAttributedString alloc] init];
    [regular enumerateMatchesInString:string options:0 range:range usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        NSRange range = result.range;
        
        NSString *emojiName = [string substringWithRange:range];
        
        NSRange subRange = NSMakeRange(lastRange.location+lastRange.length, range.location-lastRange.location-lastRange.length);
        if (subRange.length) {
            NSString *commonStr = [string substringWithRange:subRange];
            [mstr appendAttributedString:[[NSAttributedString alloc] initWithString:commonStr]];
        }
        
        NSString *emojiFileName = [emojiDic objectForKey:emojiName];
        
        if (emojiFileName) {
            NSDictionary *fileAttr = [NSDictionary dictionaryWithObjectsAndKeys:@(20), @"width", @(20), @"height", nil];
            NSMutableAttributedString *imgStr = [CoreTextTools configWithImageFileName:emojiFileName imageAttr:fileAttr];
            [mstr appendAttributedString:imgStr];
        } else {
            [mstr appendAttributedString:[[NSAttributedString alloc] initWithString:emojiName]];
        }
        lastRange = range;
    }];
    
    if (lastRange.location + lastRange.length < string.length) {
        NSString *substr = [string substringWithRange:NSMakeRange(lastRange.location+lastRange.length, string.length-lastRange.location-lastRange.length)];
        [mstr appendAttributedString:[[NSAttributedString alloc] initWithString:substr]];
    }
    
    CTFramesetterRef ctFrameSetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)mstr);
    return ctFrameSetter;
}

+ (NSMutableAttributedString *)configWithImageFileName: (NSString *)name imageAttr: (NSDictionary *)dic {
    CTRunDelegateCallbacks imageCallbacks;
    imageCallbacks.version = kCTRunDelegateVersion1;
    imageCallbacks.dealloc = RunDelegateDeallocCallback;
    imageCallbacks.getAscent = RunDelegateGetAscentCallback;
    imageCallbacks.getDescent = RunDelegateGetDescentCallback;
    imageCallbacks.getWidth = RunDelegateGetWidthCallback;
    CTRunDelegateRef runDelegate = CTRunDelegateCreate(&imageCallbacks, (__bridge void *)(dic));
    unichar objectReplacementChar = 0xFFFC;
    NSString * objectAttributedString = [NSString stringWithCharacters:&objectReplacementChar length:1];
    NSMutableAttributedString *imageAttributedString = [[NSMutableAttributedString alloc] initWithString:objectAttributedString attributes:nil];
    
    [imageAttributedString addAttribute:(NSString *)kCTRunDelegateAttributeName value:(__bridge id)runDelegate range:NSMakeRange(0, 1)];//设置回调
    CFRelease(runDelegate);
    
    [imageAttributedString addAttribute:@"imageName" value:name range:NSMakeRange(0, 1)];
    
    return imageAttributedString;
}

static CGFloat RunDelegateGetAscentCallback(void *ref)
{
    NSDictionary *dic = (__bridge NSDictionary *)ref;
    NSNumber *ascent = dic[@"height"];
    return [ascent floatValue] ? [ascent floatValue]/4*3 : 10;
}

static CGFloat RunDelegateGetDescentCallback(void *ref)
{
    NSDictionary *dic = (__bridge NSDictionary *)ref;
    NSNumber *ascent = dic[@"height"];
    return [ascent floatValue] ? [ascent floatValue]/4 : 10;
}

static CGFloat RunDelegateGetWidthCallback(void *ref)
{
    NSDictionary *dic = (__bridge NSDictionary *)ref;
    
    NSNumber *width = dic[@"width"];
    
    return [width floatValue] ? [width floatValue] : 20;
}

static void RunDelegateDeallocCallback(void *refCon){
    
}
@end

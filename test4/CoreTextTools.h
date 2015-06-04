//
//  CoreTextTools.h
//  test4
//
//  Created by tangbo on 15/6/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface CoreTextTools : NSObject

/**
 *string: 带表情的特殊文本
 *emojiDic: 表情图片对照表
 */
+ (CTFramesetterRef)configWithText: (NSString *)string emoji: (NSDictionary *)emojiDic;
+ (NSMutableAttributedString *)configWithImageFileName: (NSString *)name imageAttr: (NSDictionary *)dic;
+ (CGSize)fitWithSize: (CGSize)size framesetter: (CTFramesetterRef)framesetter;
@end

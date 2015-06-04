//
//  EmojiViewController.m
//  test4
//
//  Created by tangbo on 15/6/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "EmojiViewController.h"
#import <CoreText/CoreText.h>
#import "MyEmojiLabel.h"
#import "Masonry.h"
#import "CoreTextTools.h"

@interface EmojiViewController ()
@property(nonatomic, strong) NSDictionary *emojiDic;
@property(nonatomic, strong) MyEmojiLabel *label;
@end

@implementation EmojiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadEmojiData];
    
    self.label = [[MyEmojiLabel alloc] init];
    self.label.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.label];
    
    NSString *string = @"aa[好的]aaaa[眼睛]b[柿子][累][哭]c哎呀我去[得意]哎呀我去哎呀我去哎呀我去哎呀我去哎呀我去哎呀我去哎呀我去哎呀我去[飞吻][哎呀]d[愤怒]最后最后最后最后最后最后最后最后最后最后最后最后最后最后最后最后最后最后最后最后最后最后最后a[[哎呀]][[]]";
    
    CTFramesetterRef framesetter = [CoreTextTools configWithText:string emoji:_emojiDic];
    
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT);
    
    CGSize fitSize = [CoreTextTools fitWithSize:size framesetter:framesetter];
    
    self.label.frame = CGRectMake(0, 20, size.width, fitSize.height);
    self.label.framesetter = framesetter;
}

- (void)loadEmojiData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Emoji" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _emojiDic = dic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

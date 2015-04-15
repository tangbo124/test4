//
//  TestKitViewController.m
//  test4
//
//  Created by TangBo on 15/2/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestKitViewController.h"
#import "MyTextAttachment.h"
@interface TestKitViewController ()

@end

@implementation TestKitViewController
{
    UITextView *_textView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, 320, 300)];
    _textView.backgroundColor = [UIColor redColor];
    _textView.delegate = self;
    [self.view addSubview:_textView];
    
//    [self loadClickText];
    [self loadImageToText];
    
//    [self loadHtmlToTextView];
}

/**
 *  可点击文字的textView
 */
- (void)loadClickText
{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"唐波对你的图片点赞"  attributes:nil];
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: [UIColor greenColor], NSLinkAttributeName: [NSURL URLWithString:@"http://www.baidu.com"]};
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(0, string.length)];
    [string addAttributes:dic range:NSMakeRange(0, 2)];
    _textView.dataDetectorTypes = UIDataDetectorTypeLink;
    _textView.editable = NO;
    _textView.selectable = YES;
    _textView.attributedText = string;
}

/**
 *  类似表情键盘
 */
- (void)loadImageToText
{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"123456789101112"  attributes:nil];
    [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, string.length)];
    MyTextAttachment *textAttachment = [[ MyTextAttachment alloc ] initWithData:nil ofType:nil];
    
    UIImage *smileImage = [ UIImage imageNamed:@"1"];
    
    textAttachment.image = smileImage;
    
    NSAttributedString *textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    
    [string insertAttributedString:textAttachmentString atIndex:6];
    _textView.editable = NO;//使UITextView中的图片可点击
    _textView.attributedText = string;
}

/**
 *  把HTML文件转化为NSAttributedString
 */
- (void)loadHtmlToTextView
{
    // Create attributed string from HTML
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
    NSLog(@"url : %@", url);
    NSAttributedString *attrStr = [[NSAttributedString alloc]
                                   initWithFileURL:url
                                   options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType}
                                   documentAttributes:nil error:nil];
    [_textView setAttributedText:attrStr];
    
}

/**
 *  当点击UITextView中的链接时,触发这个方法
 *
 */
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange NS_AVAILABLE_IOS(7_0)
{
    NSLog(@"url : %@", [URL absoluteString]);
    return YES;
}

/**
 *  当点击UITextView中的图片时,触发这个方法
 *
 */
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    NSLog(@"textAttachment : %@", textAttachment);
    return YES;
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

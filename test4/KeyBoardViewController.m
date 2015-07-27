//
//  KeyBoardViewController.m
//  test4
//
//  Created by tangbo on 15/6/19.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "KeyBoardViewController.h"
#import "Masonry.h"
@interface KeyBoardViewController ()

@end

@implementation KeyBoardViewController
{
    UITextView *_textView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _textView = [[UITextView alloc] init];
    _textView.backgroundColor = [UIColor redColor];
//    _textView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_textView];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(200);
    }];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyBoardShow:(NSNotification *)n {
    NSLog(@"键盘显示");
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

//
//  ScrollViewWithAutoLayoutViewController.m
//  test4
//
//  Created by tangbo on 15/4/23.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "ScrollViewWithAutoLayoutViewController.h"

@interface ScrollViewWithAutoLayoutViewController ()
@property(nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ScrollViewWithAutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [UIScrollView new];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.scrollView];
    
    NSArray *contraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_scrollView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_scrollView)];
    NSArray *contraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_scrollView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_scrollView)];
    [NSLayoutConstraint activateConstraints:contraints1];
    [NSLayoutConstraint activateConstraints:contraints2];
    
    [self test1];
}

- (void)test1 {
    self.scrollView.pagingEnabled = YES;
    int count = 5;
    CGFloat imgWidth = self.view.bounds.size.width;
    CGFloat imgHeight = self.view.bounds.size.height;
    UIView *preView = nil;
    for (int i = 1; i < count; i ++) {
        UIImageView *imgView = [UIImageView new];
        imgView.translatesAutoresizingMaskIntoConstraints = NO;
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i", i]];
        [self.scrollView addSubview:imgView];
        
        NSArray *contraintsH = nil;
        if (preView == nil) {
            contraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imgView(imgWidth)]" options:0 metrics:@{@"imgWidth": @(imgWidth)} views:NSDictionaryOfVariableBindings(imgView)];
        }else {
            if (i == count - 1) {
                contraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[preView]-0-[imgView(preView)]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(preView, imgView)];
            }else {
                contraintsH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[preView]-0-[imgView(preView)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(preView, imgView)];
            }
        }
        
        NSArray *contrainstV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imgView(imgHeight)]-0-|" options:0 metrics:@{@"imgHeight": @(imgHeight)} views:NSDictionaryOfVariableBindings(imgView)];
        [NSLayoutConstraint activateConstraints:contraintsH];
        [NSLayoutConstraint activateConstraints:contrainstV];
        preView = imgView;
    }
}

- (void)test2 {
    NSMutableString *strH = [NSMutableString string];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < 5; i ++) {
        UIView *view = [UIView new];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.backgroundColor = [UIColor redColor];
        [self.scrollView addSubview:view];
        
        [dic setObject:view forKey:[NSString stringWithFormat:@"view%i", i]];
        switch (i) {
            case 0:
                [strH appendString:[NSString stringWithFormat:@"H:|-0-[view%i(>=100)]", i]];
                break;
            case 4:
                [strH appendString:[NSString stringWithFormat:@"-0-[view%i(view%i)]-0-|", i, i-1]];
                break;
            default:
                [strH appendString:[NSString stringWithFormat:@"-0-[view%i(view%i)]", i, i-1]];
                break;
        }
        NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view(>=100)]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)];
        [NSLayoutConstraint activateConstraints:constraintV];
    }
    NSArray *constrainH = [NSLayoutConstraint constraintsWithVisualFormat:strH options:0 metrics:nil views:dic];
    [NSLayoutConstraint activateConstraints:constrainH];
}

- (void)test3 {
    
    UIImageView *imgView = [UIImageView new];
    imgView.backgroundColor = [UIColor redColor];
    imgView.translatesAutoresizingMaskIntoConstraints = NO;
    imgView.image = [UIImage imageNamed:@"1"];
    [self.scrollView addSubview:imgView];
    
    CGFloat imgWidth = self.view.bounds.size.width+100;
    CGFloat imgHeight = self.view.bounds.size.height+100;
    /*
     *    "-0-|"必须带上
     */
    /*
     *向UIScrollView中添加子视图时, 子View的约束表达式必须类似于H:|-0-[view(100)]-0-|的形式,
     *因为contentSize.width = leftPadding+width+rightPadding
     *   contentSize.height = topPadding+height+bottomPadding
     */
    NSArray *contraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[imgView(imgWidth)]-0-|" options:0 metrics:@{@"imgWidth": @(imgWidth)} views:NSDictionaryOfVariableBindings(imgView)];
    
    NSArray *contraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[imgView(imgHeight)]-0-|" options:0 metrics:@{@"imgHeight": @(imgHeight)} views:NSDictionaryOfVariableBindings(imgView)];
    
    [self.scrollView addConstraints:contraints1];
    [self.scrollView addConstraints:contraints2];
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

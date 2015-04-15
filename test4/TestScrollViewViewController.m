//
//  TestScrollViewViewController.m
//  test4
//
//  Created by TangBo on 15/1/27.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestScrollViewViewController.h"
#import "UIScrollView+Circle.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT 300
@interface TestScrollViewViewController ()

@end

@implementation TestScrollViewViewController
{
    NSMutableArray *dataArray;
    UIScrollView *_scrollView;
    CGPoint lastPoint;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = [[NSMutableArray alloc] init];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, WIDTH, HEIGHT)];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(WIDTH * 4, HEIGHT);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    for (int i = 0; i < 4; i ++) {
        CGFloat w = scrollView.frame.size.width;
        CGFloat h = scrollView.frame.size.height;
        CGFloat x = i * w;
        CGFloat y = 0;
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        view.tag = 1000 + i;
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.png", i + 1]];
        [scrollView addSubview:view];
        [dataArray addObject:view];
    }
    scrollView.circleDataArray = dataArray;
}

- (void)printToConsle
{

}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGPoint point = scrollView.contentOffset;
//    NSLog(@"contentoffset : %f", point.x);
//    if (!scrollView.isDragging) {
////        NSLog(@"contentoffset : %f", scrollView.contentOffset.x);
//    }else{
//        lastPoint = point;
//    }
//    scrollView.contentOffset = lastPoint;
//}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    CGPoint point = scrollView.contentOffset;
//    NSLog(@"%f", point.x);
//    CGFloat pageWidth = scrollView.frame.size.width;
//    // 0 1 2
//    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    if(page == 1) {
//        return;
//    } else if (page == 0) {
//        [self pageMoveToRight];
//    } else {
//        [self pageMoveToLeft];
//    }
//    
//    CGPoint p = CGPointZero;
//    p.x = pageWidth;
//    [scrollView setContentOffset:p animated:NO];
//}

- (void)pageMoveToRight {
    UIView *tempView = [dataArray lastObject];
    for (NSInteger i = dataArray.count-2; i >= 0; i --) {
      dataArray[i + 1] = dataArray[i];
    }
    dataArray[0] = tempView;
    [self setPageFrame];
}

- (void)pageMoveToLeft {
    UIView *tempView = dataArray[0];
    for (NSInteger i = 1; i < dataArray.count; i ++) {
        dataArray[i - 1] = dataArray[i];
    }
    dataArray[dataArray.count - 1] = tempView;
    [self setPageFrame];
}

- (void)setPageFrame
{
    for (int i = 0; i < dataArray.count; i ++) {
        CGFloat w = _scrollView.frame.size.width;
        CGFloat h = _scrollView.frame.size.height;
        CGFloat x = i * w;
        CGFloat y = 0;
        UIView *view = dataArray[i];
        view.frame = CGRectMake(x, y, w, h);
    }
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

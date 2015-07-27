//
//  ActionShowViewController.m
//  test4
//
//  Created by tangbo on 15/7/6.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "ActionShowViewController.h"
static NSString *cellReuser = @"cell";
static int count = 0;
@interface ActionShowViewController ()

@end

@implementation ActionShowViewController
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 320, 480)];
    mainView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:1];
    [self.view addSubview:mainView];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    redView.backgroundColor = [UIColor colorWithRed:0.815 green:0.007
                                               blue:0.105 alpha:1];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(150, 160, 150, 200)];
    greenView.backgroundColor = [UIColor colorWithRed:0.494 green:0.827
                                                 blue:0.129 alpha:1];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(40, 400, 200, 150)];
    blueView.backgroundColor = [UIColor colorWithRed:0.29 green:0.564
                                                blue:0.886 alpha:1];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 600, 180, 150)];
    yellowView.backgroundColor = [UIColor colorWithRed:0.972 green:0.905
                                                  blue:0.109 alpha:1];
    
    [mainView addSubview:redView];
    [mainView addSubview:greenView];
    [mainView addSubview:blueView];
    [mainView addSubview:yellowView];
    
    CGRect bounds = mainView.bounds;
    bounds.origin = CGPointMake(0, -100);
    mainView.bounds = bounds;
    
    
    UIView *purView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 180, 150)];
    purView.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:purView];
//    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"hah" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles: nil];
//    [sheet showInView:self.view];
/*
    _dataArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 30; i ++) {
        [_dataArray addObject:[NSString stringWithFormat:@"%i", i]];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuser];
    [self.view addSubview:_tableView];
    
    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
    CFStringRef runLoopMode = kCFRunLoopDefaultMode;
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, true, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"执行");
    });
    CFRunLoopAddObserver(runLoop, observer, runLoopMode);
 */
}
/*
#pragma - mark - UITableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuser forIndexPath:indexPath];

    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"count = %i", count);
    count ++;
    return 44;
}
*/
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

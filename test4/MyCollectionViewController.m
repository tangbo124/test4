//
//  MyCollectionViewController.m
//  test4
//
//  Created by tangbo on 15/8/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "MyCollectionViewCell.h"
#import "MyLayout.h"

static NSString * const reuseCell = @"cell";

@interface MyCollectionViewController ()
@property (nonatomic, copy) NSArray *dataArray;
@end

@implementation MyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpData];
    
    MyLayout *layout = [[MyLayout alloc] init];
    layout.columns = 3;
    layout.itemWidth = 100;
    layout.lineSpacing = 10;

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:reuseCell];
    [self.view addSubview:collectionView];
}

- (void)setUpData
{
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 100; i ++) {
        [arr addObject:@(i)];
    }
    self.dataArray = [arr copy];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@", self.dataArray[indexPath.item]];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(MyLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 100 + arc4random()%100;
    return height;
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

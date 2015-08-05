//
//  SimpleCollectionViewViewController.m
//  test4
//
//  Created by tangbo on 15/8/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "SimpleCollectionViewViewController.h"
#import "MyCollectionViewCell.h"

static NSString * const reuseCell = @"cell";

@interface SimpleCollectionViewViewController ()
@property (nonatomic, copy) NSArray *dataArray;
@end

@implementation SimpleCollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpData];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 50;
//    layout.minimumInteritemSpacing = 50;
    layout.itemSize = CGSizeMake(100, 100);
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20) collectionViewLayout:layout];
    collectionView.dataSource = self;
//    collectionView.delegate = self;
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

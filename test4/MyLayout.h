//
//  MyLayout.h
//  test4
//
//  Created by tangbo on 15/8/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyLayout;

@protocol UICollectionViewDelegateMyLayout <UICollectionViewDelegate>

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(MyLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MyLayout : UICollectionViewLayout
@property (nonatomic, assign) NSInteger columns;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat lineSpacing;
@end

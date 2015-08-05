//
//  MyLayout.m
//  test4
//
//  Created by tangbo on 15/8/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyLayout.h"

@interface MyLayout ()

@property (nonatomic, strong) NSMutableDictionary *lastItemBottoms;
@property (nonatomic, strong) NSMutableArray *layoutInfos;

@end

@implementation MyLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lastItemBottoms = [NSMutableDictionary dictionaryWithCapacity:self.columns];
        _layoutInfos = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)prepareLayout
{
    NSInteger sections = [self.collectionView numberOfSections];
    
    CGFloat width = self.collectionView.frame.size.width;
    
    CGFloat interItemSpacing = (width - self.columns * self.itemWidth) / (self.columns - 1);
    for (int i = 0; i < sections; i ++) {
        NSInteger items = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < items; j ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            if ([self.collectionView.delegate respondsToSelector:@selector(collectionView: layout: heightForItemAtIndexPath:)]) {
                CGFloat height = [(id<UICollectionViewDelegateMyLayout>)self.collectionView.delegate collectionView:self.collectionView layout:self heightForItemAtIndexPath:indexPath];
                
                NSInteger key = indexPath.item % self.columns;
                
                CGFloat x = key * (self.itemWidth + interItemSpacing);
                CGFloat lastItemBottom = [[self.lastItemBottoms objectForKey:@(key)] doubleValue];
                CGFloat y = lastItemBottom + self.lineSpacing;
                
                [self.lastItemBottoms setObject:@(y + height) forKey:@(key)];
                
                attr.frame = CGRectMake(x, y, self.itemWidth, height);
                
                [self.layoutInfos addObject:attr];
            };
        }
    }
}

- (CGSize)collectionViewContentSize
{
    CGFloat maxBottom = 0.f;
    for (NSNumber *bottom in [self.lastItemBottoms allValues]) {
        CGFloat bott = [bottom doubleValue];
        if (bott > maxBottom) {
            maxBottom = bott;
        }
    }
    return CGSizeMake(self.collectionView.frame.size.width, maxBottom + self.lineSpacing);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSLog(@"%@", NSStringFromCGRect(rect));
    NSMutableArray *visableAttrs = [[NSMutableArray alloc] init];
    [self.layoutInfos enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attr, NSUInteger idx, BOOL *stop) {
        if (CGRectIntersectsRect(rect, attr.frame)) {
            [visableAttrs addObject:attr];
        }
    }];
    return visableAttrs;
}

//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView: layout: heightForItemAtIndexPath:)]) {
//        CGFloat height = [(id<UICollectionViewDelegateMyLayout>)self.collectionView.delegate collectionView:self.collectionView layout:self heightForItemAtIndexPath:indexPath];
//        
//        NSInteger key = indexPath.item % self.columns;
//        
//        CGFloat x = key * (self.itemWidth + self.interItemSpacing);
//        CGFloat lastItemBottom = [[self.lastItemBottoms objectForKey:@(key)] doubleValue];
//        CGFloat y = lastItemBottom + self.lineSpacing;
//        
//        [self.lastItemBottoms setObject:@(y + height) forKey:@(key)];
//        
//        attr.frame = CGRectMake(x, y, self.itemWidth, height);
//    };
//    return attr;
//}
@end

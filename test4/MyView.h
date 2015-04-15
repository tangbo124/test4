//
//  MyView.h
//  test4
//
//  Created by TangBo on 15/2/4.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MyBlock)(void);

@interface MyView : UIView

@property (nonatomic, copy) MyBlock myBlock;

- (void)testBlock:(MyBlock)myBlock;

@end

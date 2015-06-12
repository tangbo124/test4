//
//  BlockView.h
//  test4
//
//  Created by tangbo on 15/6/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block)(void);

@interface BlockView : UIView
@property(nonatomic, copy) Block block;
@end

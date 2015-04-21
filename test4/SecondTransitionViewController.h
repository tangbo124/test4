//
//  SecondTransitionViewController.h
//  test4
//
//  Created by tangbo on 15/4/20.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BtnClickBlock)();

@interface SecondTransitionViewController : UIViewController
@property (nonatomic, copy) BtnClickBlock btnCLickBlock;
@end

//
//  SecondFilterViewController.h
//  test4
//
//  Created by TangBo on 15/2/3.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondFilterViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy) NSString *selectedCategory;
@end

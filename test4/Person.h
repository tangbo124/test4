//
//  Person.h
//  test4
//
//  Created by tangbo on 15/6/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonInfo <NSObject>
@optional
- (void)name;
- (void)age;
@end

@interface Person : NSObject
@property(nonatomic, weak) id<PersonInfo> child;
@end

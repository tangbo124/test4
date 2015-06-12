//
//  Person.m
//  test4
//
//  Created by tangbo on 15/6/5.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        if ([self conformsToProtocol:@protocol(PersonInfo)]) {
            self.child = (id<PersonInfo>)self;
//            NSLog(@"self: %@, child: %@", self, self.child);
        } else {
            NSAssert(NO, @"没有实现协议");
        }
        
    }
    return self;
}

- (void)name {
    NSLog(@"person");
}

- (void)age {
    [self.child name];
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}
@end

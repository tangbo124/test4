//
//  SwizzleViewController.m
//  test4
//
//  Created by tangbo on 15/4/22.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "SwizzleViewController.h"
#import "UIViewController+Logging.h"
#import <objc/runtime.h>
#import "B.h"
@implementation SwizzleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    B *b = [[B alloc] init];
    [b justTest1];
    swizzleMethod2([b class], @selector(justTest1), @selector(justTest2));
    [b justTest1];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"AAAAAAAAAAAAAAAAA");
}

void swizzleMethod2(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    // the method doesn’t exist and we just added one
    NSLog(@"didAddMethod = %i", didAddMethod);
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end

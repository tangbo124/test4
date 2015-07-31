//
//  UIViewController+Logging.m
//  test4
//
//  Created by tangbo on 15/4/22.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "UIViewController+Logging.h"
#import <objc/runtime.h>
@implementation UIViewController (Logging)

/*
 *博文解读:http://tech.glowing.com/cn/method-swizzling-aop/
 */

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
    });
}

- (void)swizzled_viewDidAppear:(BOOL)animated
{
    NSLog(@"hahahah");
    // call original implementation
    [self swizzled_viewDidAppear:animated];
    // Logging
//    [Logging logWithEventName:NSStringFromClass([self class])];
    NSLog(@"在这里打个log");
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end

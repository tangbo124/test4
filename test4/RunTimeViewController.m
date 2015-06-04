//
//  RunTimeViewController.m
//  test4
//
//  Created by tangbo on 15/4/22.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "RunTimeViewController.h"
#import <objc/message.h>
@interface RunTimeViewController ()

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    objc_msgSend(self, @selector(testFunc:), @"哈哈哈");
}

void fooMethod(id obj, SEL _cmd, id newValue)
{
    NSLog(@"当前对象: %@, 被替换的方法: %@, 被替换方法的参数: %@", obj, NSStringFromSelector(_cmd), newValue);
    NSLog(@"Doing foo");
}

//当testFunc:未定义时,系统会自动调用resolveInstanceMethod:方法
+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    if(aSEL == @selector(testFunc:)){
        /*
         class_addMethod(Class cls, SEL name, IMP imp, const char *types)
         
         cls：被添加方法的类
         
         name：可以理解为方法名,不能是已经存在的函数
         
         imp：实现这个方法的函数
         
         types：一个定义该函数返回值类型和参数类型的字符串,官方文档https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
         */
        class_addMethod([self class], aSEL, (IMP)fooMethod, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

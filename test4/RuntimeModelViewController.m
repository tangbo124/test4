//
//  RuntimeModelViewController.m
//  test4
//
//  Created by tangbo on 15/8/7.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "RuntimeModelViewController.h"
#import "PersonModel.h"
#import <objc/runtime.h>
@interface RuntimeModelViewController ()

@end

@implementation RuntimeModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{@"name": @"tangbo",
                          @"age": @(12),
                          @"address": @"北京"};
    
    PersonModel *model = [[PersonModel alloc] init];
    NSDictionary *mapDic = [model propertyMap];
    
    for (NSString *key in mapDic) {
        [model setValue:dic[mapDic[key]] forKey:key];
    }
    
    NSLog(@"%@", model);
    
    [self getAllPropertys:model];
}

- (void)getAllPropertys:(id)model
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList([model class], &count);
    for (int i = 0; i < count; i ++) {
        objc_property_t property = propertys[i];
        const char *propertyName = property_getName(property);
        NSString *propertyStrName = [NSString stringWithUTF8String:propertyName];
        id value = [model valueForKey:propertyStrName];
        [dic setObject:value forKey:propertyStrName];
    }
    free(propertys);
    NSLog(@"%@", dic);
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

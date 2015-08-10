//
//  PersonModel.m
//  test4
//
//  Created by tangbo on 15/8/7.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (NSDictionary *)propertyMap
{
    return @{@"personName": @"name",
             @"personAge": @"age",
             @"personAddress": @"address"
             };
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@, age: %@, address: %@", _personName, _personAge, _personAddress];
}
@end

//
//  PersonModel.h
//  test4
//
//  Created by tangbo on 15/8/7.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject
@property(nonatomic, copy) NSString *personName;
@property(nonatomic, copy) NSNumber *personAge;
@property(nonatomic, copy) NSString *personAddress;

- (NSDictionary *)propertyMap;

@end

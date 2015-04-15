//
//  MyImageView.h
//  test4
//
//  Created by TangBo on 15/2/13.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface MyImageView : GLKView

@property (nonatomic, strong) CIFilter *filter;

@property (nonatomic, strong) CIImage *inputImage;

@end

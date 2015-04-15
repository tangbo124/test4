//
//  MyImageView.m
//  test4
//
//  Created by TangBo on 15/2/13.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView
{
    CIContext *context;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        EAGLContext *eaglcontext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        self.context = eaglcontext;
        context = [CIContext contextWithEAGLContext:eaglcontext];
        
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGRect drawableBounds = CGRectMake(0, 0, self.drawableWidth, self.drawableHeight);
    CGRect targetBounds = drawableBounds;
//    CGRect targetBounds = [self imageBoundsForContentModeFromRect:inputCIImage.extent toRect:drawableBounds];
    [context drawImage:self.filter.outputImage inRect:targetBounds fromRect:self.inputImage.extent];
}

- (CGRect)aspectFitFromRect: (CGRect)fromRect toRect: (CGRect)toRect
{
    CGFloat fromAspectRatio = fromRect.size.width / fromRect.size.height;
    CGFloat toAspectRatio = toRect.size.width / toRect.size.height;
    
    CGRect fitRect = toRect;
    
    if (fromAspectRatio > toAspectRatio) {
        fitRect.size.height = toRect.size.width / fromAspectRatio;
        fitRect.origin.y += (toRect.size.height - fitRect.size.height) * 0.5;
    } else {
        fitRect.size.width = toRect.size.height  * fromAspectRatio;
        fitRect.origin.x += (toRect.size.width - fitRect.size.width) * 0.5;
    }
    
    return CGRectIntegral(fitRect);
}

-(CGRect) aspectFillFromRect: (CGRect)fromRect toRect: (CGRect)toRect
{
    CGFloat fromAspectRatio = fromRect.size.width / fromRect.size.height;
    CGFloat toAspectRatio = toRect.size.width / toRect.size.height;
    
    CGRect fitRect = toRect;
    
    if (fromAspectRatio > toAspectRatio) {
        fitRect.size.width = toRect.size.height  * fromAspectRatio;
        fitRect.origin.x += (toRect.size.width - fitRect.size.width) * 0.5;
    } else {
        fitRect.size.height = toRect.size.width / fromAspectRatio;
        fitRect.origin.y += (toRect.size.height - fitRect.size.height) * 0.5;
    }
    
    return CGRectIntegral(fitRect);
}

- (CGRect)imageBoundsForContentModeFromRect: (CGRect)fromRect toRect: (CGRect)toRect
{
    switch (self.contentMode) {
        case UIViewContentModeScaleAspectFill:
            return [self aspectFillFromRect:fromRect toRect:toRect];
            break;
        case UIViewContentModeScaleAspectFit:
            return  [self aspectFitFromRect:fromRect toRect:toRect];
            break;
        default:
            return fromRect;
            break;
    }
}

@end

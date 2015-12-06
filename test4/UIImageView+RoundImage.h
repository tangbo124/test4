//
//  UIImageView+RoundImage.h
//  test4
//
//  Created by tangbo on 15/12/6.
//  Copyright © 2015年 onlylady. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RoundImage)
- (void)cropImageToRoundWithUrl: (NSString *)url size:(CGSize)size;
@end

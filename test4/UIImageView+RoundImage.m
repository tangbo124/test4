//
//  UIImageView+RoundImage.m
//  test4
//
//  Created by tangbo on 15/12/6.
//  Copyright © 2015年 onlylady. All rights reserved.
//

#import "UIImageView+RoundImage.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (RoundImage)
- (void)cropImageToRoundWithUrl: (NSString *)url size:(CGSize)size {
    UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:url];
    if (cacheImage) {
        self.image = cacheImage;
    } else {
        [self sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            UIImageView *roundedView = [[UIImageView alloc] initWithImage:image];
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:size.width / 2];
            CAShapeLayer *layer = [CAShapeLayer new];
            layer.path = path.CGPath;
            
            roundedView.layer.mask = layer;
            
            UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
            [roundedView.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.image = newImage;
            [[SDImageCache sharedImageCache] storeImage:newImage forKey:imageURL.absoluteString];
        }];
    }
}
@end

//
//  NetworkImageViewController.m
//  test4
//
//  Created by tangbo on 15/12/6.
//  Copyright © 2015年 onlylady. All rights reserved.
//

#import "NetworkImageViewController.h"
#import "Masonry.h"
#import "UIImageView+RoundImage.h"

@interface NetworkImageViewController ()
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation NetworkImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imgView];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    NSString *urlStr = @"http://7xoamd.com1.z0.glb.clouddn.com/Fo4DcYoIh36lEVa8g81R2NDBruqn";
    
    [self.imgView cropImageToRoundWithUrl:urlStr size:CGSizeMake(100, 100)];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = ({
            UIImageView *view = [UIImageView new];
            
            view;
        });
    }
    return _imgView;
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

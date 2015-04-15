//
//  TestNetWorkViewController.m
//  test4
//
//  Created by TangBo on 15/2/7.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "TestNetWorkViewController.h"

@interface TestNetWorkViewController ()

@end

@implementation TestNetWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void)test
{
    //    AFHTTPRequestOperationManager *_manager = [AFHTTPRequestOperationManager manager];
    //    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    ////    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    [_manager GET:@"http://olshow.onlylady.com/index.php?c=LookAPI&a=Default" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //        NSLog(@"success");
    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //        NSLog(@"fail");
    //    }];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://olshow.onlylady.com/index.php?c=LookAPI&a=Default&rd=201&type=4&key=a&pm=1"]];
    NSURLConnection *con = [NSURLConnection connectionWithRequest:request delegate:self];
    [con start];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"success");
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

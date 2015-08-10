//
//  AppDelegate.m
//  test4
//
//  Created by TangBo on 15/1/17.
//  Copyright (c) 2015年 onlylady. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ImageFilterViewController.h"
#import "ViewController.h"
#import "TestScrollViewViewController.h"
#import "ScreenShotViewController.h"
#import "TestTableViewViewController.h"
#import "TestImagePickerViewController.h"
#import "TestKitViewController.h"
#import "MyImageFilterViewController.h"
#import "UIDynamicsViewController.h"
#import "TestQuarzViewController.h"
#import "TestNetWorkViewController.h"
#import "AnimationViewController.h"
#import "AutoLayoutViewController.h"
#import "MasonryViewController.h"
#import "MyTableViewViewController.h"
#import "LabelAutoFitViewController.h"
#import "ToolBarViewController.h"
#import "AWTViewController.h"
#import "RootTransitionViewController.h"
#import "RunTimeViewController.h"
#import "SwizzleViewController.h"
#import "ScrollViewWithAutoLayoutViewController.h"
#import "TestLayoutSubviewsViewController.h"
#import "TestCircleTableViewViewController.h"
#import "TestNavigationBarViewController.h"
#import "TestPanViewController.h"
#import "CoreTextViewController.h"
#import "EmojiViewController.h"
#import "Transform3DViewController.h"
#import "CubeViewController.h"
#import "TestProtocolViewController.h"
#import "CustomNavigationViewController.h"
#import "KeyBoardViewController.h"
#import "ActionShowViewController.h"
#import "CAGradientLayerViewController.h"
#import "OffScreenViewController.h"
#import "SimpleCollectionViewViewController.h"
#import "MyCollectionViewController.h"
#import "HTTPSTestViewController.h"
#import "RuntimeModelViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
//    ViewController *vc = [[ViewController alloc] init];
//    ScreenShotViewController *vc = [[ScreenShotViewController alloc] init];
//    ImageFilterViewController *vc = [[ImageFilterViewController alloc] init];
//    TestScrollViewViewController *vc = [[TestScrollViewViewController alloc] init];
//    TestTableViewViewController *vc = [[TestTableViewViewController alloc] init];
//    TestImagePickerViewController *vc = [[TestImagePickerViewController alloc] init];
//    TestKitViewController *vc = [[TestKitViewController alloc] init];
//    MyImageFilterViewController *vc = [[MyImageFilterViewController alloc] init];
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
//    UIDynamicsViewController *vc = [[UIDynamicsViewController alloc] init];
//    TestNetWorkViewController *vc = [[TestNetWorkViewController alloc] init];
//    AnimationViewController *vc = [[AnimationViewController alloc] init];
//    AutoLayoutViewController *vc = [[AutoLayoutViewController alloc] init];
//    MasonryViewController *vc = [[MasonryViewController alloc] init];
//    MyTableViewViewController *vc = [[MyTableViewViewController alloc] init];
//    LabelAutoFitViewController *vc = [[LabelAutoFitViewController alloc] init];
//    ToolBarViewController *vc = [[ToolBarViewController alloc] init];
//    ScrollViewWithAutoLayoutViewController *vc = [[ScrollViewWithAutoLayoutViewController alloc] init];
//    RootTransitionViewController *vc = [[RootTransitionViewController alloc] init];
//    RunTimeViewController *vc = [[RunTimeViewController alloc] init];
//    SwizzleViewController *vc = [[SwizzleViewController alloc] init];
//    AWTViewController *vc = [[AWTViewController alloc] init];
//    TestLayoutSubviewsViewController *vc = [[TestLayoutSubviewsViewController alloc] init];
//    TestScrollViewViewController *vc = [[TestScrollViewViewController alloc] init];
//    TestCircleTableViewViewController *vc = [[TestCircleTableViewViewController alloc] init];
//    TestNavigationBarViewController *vc = [[TestNavigationBarViewController alloc] init];
//    CustomNavigationViewController *nvc = [[CustomNavigationViewController alloc] initWithRootViewController:vc];
//    TestPanViewController *vc = [[TestPanViewController alloc] init];
//    CoreTextViewController *vc = [[CoreTextViewController alloc] init];
//    EmojiViewController *vc = [[EmojiViewController alloc] init];
//    Transform3DViewController *vc = [[Transform3DViewController alloc] init];
//    CubeViewController *vc = [[CubeViewController alloc] init];
//    TestProtocolViewController *vc = [[TestProtocolViewController alloc] init];
//    KeyBoardViewController *vc = [[KeyBoardViewController alloc] init];
//    ActionShowViewController *vc = [[ActionShowViewController alloc] init];
//    CAGradientLayerViewController *vc = [[CAGradientLayerViewController alloc] init];
//    OffScreenViewController *vc = [[OffScreenViewController alloc] init];
//    SimpleCollectionViewViewController *vc = [[SimpleCollectionViewViewController alloc] init];
//    HTTPSTestViewController *vc = [[HTTPSTestViewController alloc] init];
    RuntimeModelViewController *vc = [[RuntimeModelViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

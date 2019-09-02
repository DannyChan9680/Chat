//
//  AppDelegate.m
//  UIWindow
//
//  Created by Civet on 2019/7/25.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//程序初始化成功以后调用此函数，用来初始化程序的整个架构，是ios的入口函数
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建一个UIWindow对象，整个程序有且只有一个UIWindow对象，它是特殊的UIView,其中mainScreen获得主屏幕信息，UIScreen表示屏幕硬件信息，bounds表示屏幕的宽高值
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //创建一个视图作为window的控制器
    self.window.rootViewController=[[UIViewController alloc]init];
    
    self.window.backgroundColor=[UIColor blueColor];
    //view视图为子视图
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(100, 100, 80, 80)];
    view.backgroundColor=[UIColor orangeColor];
    //子视图的坐标参照父视图的坐标系，所以子视图会随着父视图移动而移动
    [self.window addSubview:view];
    //将这个视图作为父视图
    UIView* bView=[[UIView alloc] initWithFrame:CGRectMake(120, 120, 100, 100)];
    bView.backgroundColor=[UIColor greenColor];
    [self.window addSubview:bView];
    
    //dwindow属性
    view.window;
    bView.window;
    //使windows有效并显示在屏幕上
    NSLog(@"%@",view.window);
    NSLog(@"%@",bView.window);
    NSLog(@"%@",self.window);
    self.window.rootViewController.view.window;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

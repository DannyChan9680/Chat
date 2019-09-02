//
//  AppDelegate.m
//  分栏控制器基础
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "AppDelegate.h"
#import "VCFirst.h"
#import "VCSecond.h"
#import "VCThird.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    //创建三个视图控制器
    VCFirst * vcFirst=[[VCFirst alloc] init];
    
    vcFirst.view.backgroundColor=[UIColor orangeColor];
    
    VCSecond * vcSecond=[[VCSecond alloc] init];
    
    vcSecond.view.backgroundColor=[UIColor grayColor];
    
    VCThird * vcThird=[[VCThird alloc] init];
    
    vcThird.view.backgroundColor=[UIColor greenColor];
    //显示视图
    vcFirst.title=@"第一个视图";
    vcSecond.title=@"第二个视图";
    vcThird.title=@"第三个视图";
    //创建分栏控件
    UITabBarController* tbController=[[UITabBarController alloc] init];
    //创建分栏控件数组对象
    NSArray* arrayVC=[NSArray arrayWithObjects:vcFirst,vcSecond,vcThird, nil];
    //将芬兰视图控制管理器数组赋值
    tbController.viewControllers=arrayVC;
    self.window.rootViewController=tbController;
    
    //设置选中的视图控制器中的索引, 通过索引来选择想要显示的控制器
    tbController.selectedIndex=2;
    if(tbController.selectedViewController==vcThird)
    {
        NSLog(@"q当前显示的控制器是控制器三");
    }
    //设置分栏控制器的透明度
    tbController.tabBar.translucent=NO;
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

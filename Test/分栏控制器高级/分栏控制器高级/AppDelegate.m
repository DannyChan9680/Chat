//
//  AppDelegate.m
//  分栏控制器高级
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "AppDelegate.h"
#import "VCFirst.h"
#import "VCSecond.h"
#import "VCThird.h"
#import "VCFour.h"
#import "VCFive.h"
#import "VCSix.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen] .bounds];
    
    [self.window makeKeyAndVisible];
    //创建视图控制器
    VCFirst*  vc01=[[VCFirst alloc] init];
    VCSecond* vc02=[[VCSecond alloc] init];
    VCThird*  vc03=[[VCThird alloc] init];
    VCFour *  vc04=[[VCFour alloc] init];
    VCFive*   vc05=[[VCFive alloc]init];
    VCSix *   vc06=[[VCSix alloc] init];
    //设置视图控制器颜色
    vc01.view.backgroundColor=[UIColor orangeColor];
    vc02.view.backgroundColor=[UIColor grayColor];
    vc03.view.backgroundColor=[UIColor purpleColor];
    vc04.view.backgroundColor=[UIColor greenColor];
    vc05.view.backgroundColor=[UIColor yellowColor];
    vc06.view.backgroundColor=[UIColor redColor];
    //设置控制标题
    vc01.title=@"视图1";
    vc02.title=@"视图2";
    vc03.title=@"视图3";
    vc04.title=@"视图4";
    vc05.title=@"视图5";
    vc06.title=@"视图6";
    
    //创建数组
    NSArray* arrayVC=[[NSArray alloc] initWithObjects:vc01,vc02,vc06,vc04,vc05,vc03, nil];
    //NSArray* arrayVC=@[vc01,vc02,vc03,vc04,vc05,vc06];
    UITabBarController* tbc=[[UITabBarController alloc] init];
    tbc.viewControllers=arrayVC;
    self.window.rootViewController=tbc;
    //设置工具栏颜色
    tbc.tabBar.barTintColor=[UIColor redColor];
    //设置按钮颜色
    tbc.tabBar.tintColor=[UIColor blueColor];
    //将当前控制视图作为代理对象赋值
    tbc.delegate=self;
    return YES;
}

//开始编辑时调用
-(void) tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
    NSLog(@"开始编辑前");
}
//即将结束时调用
-(void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed
{
    NSLog(@"即将结束前");
}
//结束时调用
-(void) tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed
{
    NSLog(@" VCS =%@",viewControllers);
    NSLog(@"已经结束");
    if(changed==YES)
    {
        NSLog(@"顺序发生改变");
    }
}
//
-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    /*if(tabBarController.viewControllers[tabBarController.selectedIndex]==viewController)
    {
        NSLog(@"OK!");
    }*/
    NSLog(@"选中控制对象");
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

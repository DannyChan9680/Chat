//
//  AppDelegate.m
//  ChatChat
//
//  Created by Civet on 2019/8/21.
//  Copyright © 2019 limeixiang. All rights reserved.
//
#import <UserNotifications/UserNotifications.h>
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "ChatUserTableViewController.h"
#import "ChatViewController.h"
#import "Contants.h"
#import "Firebase.h"
#import "ApiAI.h"
@interface AppDelegate ()<UNUserNotificationCenterDelegate>
@end
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //这里加载第一个页面；
    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:[[ChatViewController alloc]init]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navC;
    [self.window makeKeyAndVisible];
    
    //连接firebas
    [FIRApp configure];
    [FIRDatabase.database persistenceEnabled];
    
    
    //连接dialogflow
    AIDefaultConfiguration * configuration =[[AIDefaultConfiguration alloc] init];
    configuration.clientAccessToken=@"37f3fb6092eb4cf09dc587c109205a8b";
    _apiai=[ApiAI sharedApiAI];
    [_apiai setConfiguration:configuration];
    
    //注册通知
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"request authorization successed!");
        }
    }];
    //之前注册推送服务，用户点击了同意还是不同意，以及用户之后又做了怎样的更改我们都无从得知，现在 apple 开放了这个 API，我们可以直接获取到用户的设定信息了。
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        NSLog(@"%@",settings);
    }];
    //注册远程通知
        UNAuthorizationOptions authOptions =
        UNAuthorizationOptionAlert
        | UNAuthorizationOptionSound
        | UNAuthorizationOptionBadge;
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
        }];
        
        // For iOS 10 display notification (sent via APNS)
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    return YES;
}
//远程通知处理
- (void)showAlert:(NSDictionary *)userInfo {
    NSString *apsKey = @"aps";
    NSString *gcmMessage = @"alert";
    NSString *gcmLabel = @"google.c.a.c_l";
    
    NSDictionary *aps = userInfo[apsKey];
    if (aps) {
        NSString *message = aps[gcmMessage];
        if (message) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:userInfo[gcmLabel] message:message preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDestructive handler:nil];
                [alert addAction:dismissAction];
                [_window.rootViewController.presentedViewController presentViewController:alert animated: true completion: nil];
            });
        }
    }
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    [self showAlert:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
}

// Handle incoming notification messages while app is in the foreground.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    // Print message ID.
    NSDictionary *userInfo = notification.request.content.userInfo;
    [self showAlert:userInfo];
    
    // Change this to your preferred presentation option
    completionHandler(UNNotificationPresentationOptionNone);
}

// Handle notification messages after display notification is tapped by the user.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    [self showAlert:userInfo];
    
    completionHandler();
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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

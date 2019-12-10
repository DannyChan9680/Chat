//
//  Appelegate.m
//  IOS
//
//  Created by Civet on 2019/11/27.
//  Copyright © 2019 李美相. All rights reserved.
//

#import "Appelegate.h"

@implementation Appelegate
#import "AppDelegate.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h> // Only if you have Flutter Plugins

@interface AppDelegate () @end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end

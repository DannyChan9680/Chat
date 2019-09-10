//
//  AppDelegate.h
//  ChatChat
//
//  Created by Civet on 2019/8/21.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiAI.h"
@class LoginViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic, strong) ApiAI *apiai;
@end


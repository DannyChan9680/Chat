//
//  main.m
//  UIViewControlller
//
//  Created by Civet on 2019/7/25.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
//主函数
int main(int argc, char * argv[]) {
    @autoreleasepool {//自动内存释放
        //UIKit框架的启动函数， argc:启动时带有的参数个数，argv:参数列表，nil:主框架类对象，为nil则使用默认框架，参数四表示主框架的类对象名字
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
    }
}

//
//  ViewController.h
//  NSThread多线程
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //创建线程
    NSThread*  _thread01;
    NSThread*  _thread02;
    //定义一个计数器
    NSInteger _counter;
    //定义一个线程对象
    NSLock* _lock;
}

@end


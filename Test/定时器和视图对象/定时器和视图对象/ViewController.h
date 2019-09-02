//
//  ViewController.h
//  定时器和视图对象
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //定义一个定时器 ，可以每隔一段时间发送一个消息，通过消息来调用时间函数
    NSTimer* _timerView;
}
@property (retain ,nonatomic) NSTimer* timerView;
@end


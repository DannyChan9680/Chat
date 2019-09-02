//
//  ViewController.m
//  定时器和视图对象
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timerView=_timerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建按键对象
    UIButton* button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    //按键位置
    button.frame=CGRectMake(100, 100, 100, 100);
    //定义按键状态和事件处理
    [button setTitle:@"启动定时器" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];
     //定义按键对象
    UIButton* buttonStop=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    //按键位置
    buttonStop.frame=CGRectMake(150, 150, 100, 100);
    //设置按键内容和状态
    [buttonStop setTitle:@"结束定时器" forState:UIControlStateNormal];
    //按键事件处理
    [buttonStop addTarget:self action:@selector(pressStop)forControlEvents:UIControlEventTouchUpInside];
    //显示按键在屏幕上
    [self.view addSubview:button];
    [self.view addSubview:buttonStop];
    //创建一个视图
    UIView* view=[[UIView alloc] init];
    
    view.frame=CGRectMake(10, 10, 50, 50);
    
    view.backgroundColor=[UIColor  greenColor];
    
    [self.view addSubview:view];
    //设置视图标签
    view.tag=101;
}
//按下开始键函数
-(void)pressStart
{
    //NSTimer的类方法创建并启动定时器
    //p1:间隔时间 p2:定时器函数对象（指针） p3:函数对象  p4:参数数量  p5: 定时器是否重复
    //返回值是一个建好的定时器
    _timerView=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:@"小明" repeats:YES];
}
-(void) updateTimer:(NSTimer*) timer
{
    
    NSLog(@"test! name=%@" ,timer.userInfo);
    
   UIView* view=[self.view viewWithTag:101];
    
    view.frame=CGRectMake(view.frame.origin.x+5, view.frame.origin.y+5, 50, 50);
    
    
   //view.frame =CGRectMake(view.frame.origin+1, view.frame.origin+1, 50, 50);
}
//按下结束键函数
-(void) pressStop
{
    if(_timerView !=nil)
    {
        [_timerView invalidate];
    }
        
}
-(void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end

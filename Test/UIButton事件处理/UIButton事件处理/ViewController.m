//
//  ViewController.m
//  UIButton事件处理
//
//  Created by Civet on 2019/7/25.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//创建按钮函数
-(void)createButton
{
    UIButton* button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    button.frame=CGRectMake(100, 100, 90, 50);
    
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    //添加按钮事件函数
    //P1:实现时间函数的执行者，实现的对象是谁
    //P2:@selector(pressButton):函数对象，当按钮满足P3条件时调用函数
    //P3:UIControlEvent:事件处理函数类型
    //UIControlEventTouchUpInside:当手指离开屏幕并且手指的位置在事件范围内时触发函数
    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    //UIConrtolEventTouchDown:当手指触碰到屏幕上时
    [button addTarget:self action:@selector(TouchDown) forControlEvents:UIControlEventTouchDown];    //将按钮显示在视图中
    [self.view addSubview:button];
    
    UIButton* button02=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    button02.frame=CGRectMake(200, 100, 80, 80);
    
    [button02 setTitle:@"按钮02" forState:UIControlStateNormal];

    [button02 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button02];
    //设置按钮标记值
    button.tag=1;
    button02.tag=2;
}
//参数为调用函数按钮本身
-(void) pressButton:(UIButton*) button
{
    if(button.tag==1)
    NSLog(@"button 1 pressed ");
    else
        NSLog(@"button 2 pressed");
}
-(void)TouchDown
{
    NSLog(@"按钮被触碰");
}
-(void)pressButton02
{
    NSLog(@"按钮02被触发");
}
/*-(void)pressButton
{
    NSLog(@"按钮按下");
}
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //调用按钮函数
    [self createButton];
}


@end

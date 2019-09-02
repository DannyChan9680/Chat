//
//  ViewController.m
//  UITouch
//
//  Created by Civet on 2019/7/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建图像视图
    UIImage* image=[UIImage imageNamed:@"1.jpg"];
    
    UIImageView* iView=[[UIImageView alloc] init];
    
    iView.tag=101;
    iView.frame=CGRectMake(50, 100, 200, 300);
    //将图像视图显示在屏幕上
    [self.view addSubview:iView];
    
 

}
//当手点击屏幕开始的瞬间调用此函数
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获取点击对象
    UITouch* touch=[touches anyObject];
    if(touch.tapCount==1)
    {
        NSLog(@"单次点击");
    }
    else if(touch.tapCount==2)
    {
        NSLog(@"双次点击");
    }
    NSLog(@"手指触碰瞬间");
}
//手指在屏幕上移动时调用此函数获取移动数据
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   //
    UITouch* touch=[touches anyObject];
    
    CGPoint pt=[touch locationInView:self.view];
   // UIImageView* iView=(UIImageView*)[self.view viewWithTag:101];
    NSLog(@"x =%f, y =%f",pt.x,pt.y);
    //iView.frame=CGRectMake(pt.x, pt.y, iView.frame.size, iView.frame.size);
    NSLog(@"手指移动时");
}
//手指离开屏幕时调用
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"手指离开屏幕");
}
//在特殊情况下中断事件时调用
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch cancel");
}
@end

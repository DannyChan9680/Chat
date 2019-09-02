//
//  ViewController.m
//  UIGesture扩展手势
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
    //创建图像视图对象
    UIImageView* iView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    iView.frame=CGRectMake(50, 50, 200, 300);
    iView.userInteractionEnabled=YES;
    
    //创建一个平移手势
    UIPanGestureRecognizer* pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAct:)];
    //将手势添加到视图当中
    [iView addGestureRecognizer:pan];
    
    //构建一个滑动手势
    UISwipeGestureRecognizer* swipe=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAct:)];
    swipe.direction=UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    [iView addGestureRecognizer:swipe];
    
    //创建长按手势
    UILongPressGestureRecognizer* longPress=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressLong:)];
    longPress.minimumPressDuration=0.5;
    [iView addGestureRecognizer:longPress];
    //显示视图
    [self.view addSubview:iView];
    self.view.backgroundColor=[UIColor orangeColor];
}
-(void)pressLong:(UILongPressGestureRecognizer*) press
{
    //手势的状态对象
    if(press.state==UIGestureRecognizerStateBegan)
    {
        NSLog(@"状态开始");
    }
    else if(press.state==UIGestureRecognizerStateEnded)
    {
        NSLog(@"状态结束");
    }
    NSLog(@"长按手势");
}
-(void)swipeAct:(UISwipeGestureRecognizer*) swipe
{
    if(swipe.direction&UISwipeGestureRecognizerDirectionLeft){
        NSLog(@"向左滑动");
    }
    else if(swipe.direction&UISwipeGestureRecognizerDirectionRight)
    {
        NSLog(@"向右滑动");
    }
}
//移动事件函数
-(void)panAct:(UIPanGestureRecognizer*) pan
{
    //NSLog(@"pan");
    //获取移动对象的坐标，现对于视图的坐标系
    //参数为相对的视图对象
    CGPoint touchPoint = [pan locationInView:self.view];
    
    self.testView.center = touchPoint;
    pan.view.center = touchPoint;
   CGPoint pt=[pan translationInView:self.view];
    NSLog(@"pt.x =%.2f, pt.y =%.2f",pt.x,pt.y);
    //获取移动时的相对速度
    CGPoint pv=[pan velocityInView:self.view];
    NSLog(@"pv.x =%.2f ,pv.y =%.2f",pv.x,pv.y);
}
@end

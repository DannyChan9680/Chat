//
//  ViewController.m
//  UIView动画基础
//
//  Created by Civet on 2019/8/2.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView =[[UIImageView alloc] init];
    
    _imageView.frame=CGRectMake(100, 100, 80, 80);
    
    _imageView.image=[UIImage imageNamed:@"UNADJUSTEDNONRAW_mini_3jpg"];
    
    [self.view addSubview:_imageView];
    //设置移动按钮
    UIButton* btnMove=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btnMove.frame=CGRectMake(120, 350, 80, 40);
    
    [btnMove setTitle:@"移动" forState:UIControlStateNormal];
    //添加移动事件
    [btnMove addTarget:self action:@selector(pressMove) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btnScale=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btnScale.frame=CGRectMake(120, 400, 80, 40);
    
    [btnScale setTitle:@"缩放" forState:UIControlStateNormal];
    
    [btnScale addTarget:self action:@selector(pressScale) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_imageView];
    [self.view addSubview:btnScale];
    [self.view addSubview:btnMove];
   
}
-(void) pressScale
{
    //开始动画函数
    [UIView beginAnimations:nil context:nil];
    
    //动画的实际目标结果
    //设置动画时间函数，参数时间长度，秒为单位
    [UIView setAnimationDuration:2];
    //h设置动画延迟的时间长度，进行延迟动画处理，秒为单位
    [UIView setAnimationDelay:0];
    //设置动画代理对象
    [UIView setAnimationDelegate:self];
    //设置动画运动轨迹方式
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //设置动画结束时调用函数
    [UIView setAnimationDidStopSelector:@selector(stopAmin)];
    _imageView.frame=CGRectMake(100, 100, 80, 80);
    _imageView.alpha=0.3;
    //提交运行动画
    [UIView commitAnimations];
    
}
-(void) pressMove
{
    //开始动画函数
    [UIView beginAnimations:nil context:nil];
    
    //动画的实际目标结果
    //设置动画时间函数，参数时间长度，秒为单位
    [UIView setAnimationDuration:2];
    //h设置动画延迟的时间长度，进行延迟动画处理，秒为单位
    [UIView setAnimationDelay:0];
    //设置动画代理对象
    [UIView setAnimationDelegate:self];
    //设置动画运动轨迹方式
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //设置动画结束时调用函数
    [UIView setAnimationDidStopSelector:@selector(stopAmin)];
    _imageView.frame=CGRectMake(100, 100, 80, 80);
    //提交运行动画
    [UIView commitAnimations];
}
-(void) stopAmin
{
    NSLog(@"动画结束");
}
@end

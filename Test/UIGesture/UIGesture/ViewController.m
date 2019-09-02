//
//  ViewController.m
//  UIGesture
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
    UIImage* image=[UIImage imageNamed:@"1.jpg"];
    //创建图像视图
    _imageView=[[UIImageView alloc] init];
    _imageView.image=image;
    _imageView.frame=CGRectMake(50, 80, 300, 300);
    [self.view addSubview:_imageView];
    //交互事件响应开关
    _imageView.UserInteractionEnabled=YES;
    //创建点击手势对象，self为当前控制器
    UITapGestureRecognizer* tapOneGes=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneAct:)];
    //表示手势识别事件类型：多次点击时触发,默认值为1，
    tapOneGes.numberOfTapsRequired=1;
    //表示几个手势点击时触发此事件函数
    tapOneGes.numberOfTouchesRequired=1;
    //将点击事件添加到视图中
    [_imageView addGestureRecognizer:tapOneGes];
    
    UITapGestureRecognizer* tapTwoGes=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTwoAct:)];
    tapTwoGes.numberOfTapsRequired=1;
    tapTwoGes.numberOfTouchesRequired=1;
    [_imageView addGestureRecognizer:tapTwoGes];
    //当单击操作遇到双击操作时,单击操作失败
    [tapOneGes requireGestureRecognizerToFail:tapTwoGes];
}
-(void)tapTwoAct:(UITapGestureRecognizer*) tap
{
    NSLog(@"双次点击");
    UIImageView* imageView=(UIImageView*) tap.view;
    //创建动画过程
    [UIView beginAnimations:nil context:nil];
    //设置动画时间
    [UIView setAnimationDuration:2];
    imageView.frame=CGRectMake(0, 0, 500, 1000);
    [UIView commitAnimations];}
//时间响应函数，参数手势点击事件对象
-(void)tapOneAct:(UITapGestureRecognizer*) tap
{
    NSLog(@"单击操作");
    UIImageView* imageView=(UIImageView*) tap.view;
    //创建动画过程
    [UIView beginAnimations:nil context:nil];
    //设置动画时间
    [UIView setAnimationDuration:2];
    imageView.frame=CGRectMake(0, 0, 500, 1000);
    [UIView commitAnimations];
}

@end

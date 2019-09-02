//
//  ViewController.m
//  UIGesture高级
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
    //加载图像
    UIImage* image=[UIImage imageNamed:@"1.jpg"];
    UIImageView* iView=[[UIImageView alloc] initWithImage:image];
    
    iView.frame=CGRectMake(30, 80, 200, 300);
    iView.userInteractionEnabled=YES;
    self.view.backgroundColor=[UIColor blackColor];
    //创建一个捏合手势
    //p1:事件对象拥有者
    //p2:事件响应函数
    _pinchGes=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAct:)];
    
    //将捏合手势添加至视图中
    [iView addGestureRecognizer:_pinchGes];
    //旋转手势
    _rotGes=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotAct:)];
    //将旋转手势添加到视图中
    
   [iView addGestureRecognizer:_rotGes];
    //设置手势代理
    _rotGes.delegate=self;
    _pinchGes.delegate=self;
       [self.view addSubview:iView];
    
}
//是否可以同时响应两个手势
//如果返回值为YES：可以同时响应
//如果为NO：不可以同时响应
-(BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
//旋转手势事件函数实现
//参数：旋转手势对象
-(void)rotAct:(UIRotationGestureRecognizer*) rot
{
    //获取监控图像视图
    UIImageView* iView=(UIImageView*) rot.view;
    //计算旋转的变换矩阵并赋值
    //transform:表示图形学中的变换矩阵
    iView.transform=CGAffineTransformRotate(rot.view.transform, rot.rotation);
    //选择角度清零
    rot.rotation=0.0;
}
//
-(void)pinchAct:(UIPinchGestureRecognizer*) pinch
{
    //获取监控图像的视图
    UIImageView* iView=(UIImageView*) pinch.view;
    //对图像视图对象进行矩阵变换运算并赋值，transform表示图形学中的变换矩阵
    //CGAffineTransformScale：通过缩放方式产生新的一个矩阵
    //参数1为原来矩阵，参数2 为横向的缩放比例，参数3为纵向的缩放比例
    //返回值是新的缩放后的矩阵变换
    iView.transform=CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    //将缩放值归位为单元值，1为原来的值，<1则表示缩小，>1表示放大
    pinch.scale=1.0;
}
@end

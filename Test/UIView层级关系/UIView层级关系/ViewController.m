//
//  ViewController.m
//  UIView层级关系
//
//  Created by Civet on 2019/7/25.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建3个视图对象、视图位置以及背景颜色
    UIView* view01=[[UIView alloc] init];
    view01.frame=CGRectMake(100, 100, 80, 80);
    view01.backgroundColor=[UIColor blueColor];
    
    UIView* view02=[[UIView alloc] init];
    view02.frame=CGRectMake(110, 110, 80, 80);
    view02.backgroundColor=[UIColor redColor];
    
    UIView* view03=[[UIView alloc] init];
    view03.frame=CGRectMake(120, 120, 80, 80);
    view03.backgroundColor=[UIColor orangeColor];
    
    //显示3个视图,即显示在父视图上
    [self.view addSubview:view01];
    [self.view addSubview:view02];
    [self.view addSubview:view03];
    //将某个视图调整到最前面显示，参数：UIView对象，调整的对象到前方
    [self.view bringSubviewToFront:view01];
    //将某个视图调整到最后方
    [self.view sendSubviewToBack:view02];
    //subview管理所有的self.view的子视图的数组
    UIView* viewFont=self.view.subviews[2];
    //删除掉view01
    [view01 removeFromSuperview];
    UIView* viewBack=self.view.subviews[0];
    
    if(viewBack==view01)
        NSLog(@"相等 ");
    
    }


@end

//
//  ViewController.m
//  UIView
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
    //创建UIView对象
    //所有显示在屏幕上的对象一定都是继承于UIView
    UIView* view=[[UIView alloc] init];
    //设置view的显示位置
    view.frame=CGRectMake(100,160,180,80);
    //设置view的背景颜色
    view.backgroundColor=[UIColor redColor];
    //显示视图
    [self.view addSubview:view];
    //是否隐藏视图对象，NO:显示 YES:不显示
    view.opaque=NO;
    //设置视图的透明度，alpha：1 不透明 0 透明  0.5 半透明
    view.alpha=1;
    self.view.backgroundColor=[UIColor whiteColor];
    //是否显示透明
    view.opaque=YES;
    //是否在父视图中删除
    [view removeFromSuperview];
}


@end

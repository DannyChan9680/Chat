//
//  ViewController.m
//  UIViewControlller
//
//  Created by Civet on 2019/7/25.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//控制器第一次加载时调用此函数
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView* view=[[UIView alloc]init];
    view.frame=CGRectMake(100, 100, 80, 80);
    view.backgroundColor=[UIColor orangeColor];
    self.view.backgroundColor=[UIColor redColor];
    [self.view addSubview:view];
}


@end

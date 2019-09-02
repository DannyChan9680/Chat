//
//  ViewController.m
//  UIViewController使用
//
//  Created by Civet on 2019/7/25.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"
#import "View02.h"

@interface ViewController ()

@end

@implementation ViewController
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //控制器2
    View02* vc=[[View02 alloc] init];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}
//首次加载视图时调用
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //第一次控制其颜色为蓝色
    self.view.backgroundColor=[UIColor blueColor];
    NSLog(@"ViewDidLoad! 第一次加载视图");
}
//视图即将显示是调用，视图状态：显示前；显示中；被隐藏
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"视图即将显示 ");
}
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"试图即将消失 ");
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"视图已经显示 ");
}
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"视图已经消失 ");
}
@end

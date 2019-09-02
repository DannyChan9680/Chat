//
//  ViewController.m
//  NSThread多线程
//
//  Created by Civet on 2019/8/1.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for(int i =0 ;i<3;i++)
    {
        UIButton* btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        btn.frame=CGRectMake(100, 100+80*i, 80, 40);
        
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag=101+i;
        if(i==0)
        {
            [btn setTitle:@"启动线程" forState:UIControlStateNormal];
            
        }
        else if(i==1)
        {
            [btn setTitle:@"启动线程01" forState:UIControlStateNormal];
            
        }
        else if(i==2)
        {
            [btn setTitle:@"启动线程02" forState:UIControlStateNormal];
        }
        [self.view addSubview:btn];
    }
}
-(void) pressBtn:(UIButton*) btn
{
    //按照条件调用相关函数
    if(btn.tag==101)
    {
        NSLog(@"按钮01按下");
        //创建一个线程对象
        //p1:线程对象运行函数的拥有者
        //线程处理函数
        //线程参数
        NSThread* newT=[[NSThread alloc] initWithTarget:self selector:@selector(actNew:) object:nil];
        
        [newT start];
    }
    else if(btn.tag==102)
    {
        NSLog(@"按钮02按下");
        [NSThread detachNewThreadSelector:@selector(actT1) toTarget:self withObject:nil];
        
    }
    else if(btn.tag==103)
    {
        NSLog(@"按钮03按下");
        _thread02=[[NSThread alloc] initWithTarget:self selector:@selector(actT2) object:nil ];
        [_thread02 start];
    }
}
-(void) actT1
{
    int i=0;
    while (true)
    {
        //NSLog(@"T1 act");
        i++;
        if(i>=10000)
        {
            break;
        }
        _counter++;
        NSLog(@"c1 finale =%d",_counter);
    }
}
-(void) actT2
{
    int i=0;
    while(true)
    {
        //NSLog(@"T2 act");
        i++;
        if(i>=10000)
        {
            break;
        }
        //确保操作安全性
        _counter++;
        NSLog(@"c2 finale =%d",_counter);
        
    }
}
//p1:线程对象本身
-(void)  actNew:(NSThread*) thread
{
    int i=0;
    
    while(true)
    {
        i++;
        NSLog(@"i =%d",i);
    }
    NSLog(@"介绍循环");
}

@end

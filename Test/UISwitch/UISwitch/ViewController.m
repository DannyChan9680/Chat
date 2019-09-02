//
//  ViewController.m
//  UISwitch
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mySwitch=_myswitch;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建开关对象
    _myswitch=[[UISwitch alloc] init];
    //设置开关位置， x和y可以改变，宽高不可改变
    _myswitch.frame=CGRectMake(100, 100, 80, 80);
    
    //开关状态设置
    _myswitch.on=YES;
    //使用set函数
    [_myswitch setOn:YES];
    //设置开关状态
    [_myswitch  setOn:YES  animated:YES];
    
    [self.view addSubview:_myswitch];
    //添加事件处理
    [_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
}
-(void)swChange:(UISwitch* ) sw
{
    if(sw.on==YES)
    {
        NSLog(@"开关打开");
        
    }
    else{
        NSLog(@"开关关闭");
    }
    NSLog(@"开关状态发生变化");
}

@end

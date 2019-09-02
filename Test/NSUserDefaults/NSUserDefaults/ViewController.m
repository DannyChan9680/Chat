//
//  ViewController.m
//  NSUserDefaults
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btn.frame=CGRectMake(100, 100, 80, 40);
    
    [btn setTitle:@"写入文件" forState:UIControlStateNormal];
    
    //添加事件函数
    [btn addTarget:self action:@selector(pressWrite) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton* btnRead=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    btnRead.frame=CGRectMake(100, 200, 80, 40);
    
    [btnRead setTitle:@"读取文件" forState:UIControlStateNormal];
    
    [btnRead addTarget:self action:@selector(pressRead) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnRead];
}
-(void) pressWrite
{
    //定义一个默认的用户数据对象
    NSUserDefaults* ud=[NSUserDefaults standardUserDefaults];
    //存储字符串对象，可以将数据对象存储到内部文件中
    //参数1为存储对象，参数2为对象的名字（NSString）
    [ud setObject:@" DannyChan" forKey:@"Name"];
    
    NSNumber* num=[NSNumber numberWithInt:100];
    //存储数据对象
    [ud setObject:num forKey:@"Num"];
    
    [ud setInteger:123 forKey:@"Int"];
    
    [ud setBool:YES forKey:@"Bool"];
    
    [ud setFloat:1.22 forKey:@"Float"];
    //创建一个可文件化的数组
    NSArray* array=[NSArray arrayWithObjects:@"11",@"12",@"13", nil];
    [ud setObject:array forKey:@"Array"];
    
    
}
-(void)pressRead
{
    NSUserDefaults* ud=[NSUserDefaults standardUserDefaults];
    //存储可文件化对象数据
    id object=[ud objectForKey:@"Name"];
    
    NSString* name=(NSString*) object;
    
    NSLog(@"name =%@",name);
    object=[ud objectForKey:@"Num"];
    NSNumber* num=(NSNumber*) object;
    NSLog(@"num =%@",num);
    NSInteger iV=[ud integerForKey:@"Int"];
    
    NSLog(@"iV =%ld",iV);
    BOOL bV=[ud integerForKey:@"Bool"];
    float fV=[ud integerForKey:@"Float"];
    
    NSLog(@"bV =%d",bV);
    NSLog(@"fV =%f",fV);
    
    NSArray* array=[ud objectForKey:@"Array"];
    
    NSLog(@"array =%@",array);
    [ud removeObjectForKey:@"Array"];
}
@end

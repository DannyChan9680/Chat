//
//  ViewController.m
//  UILabel
//
//  Created by Civet on 2019/7/25.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//创建UI控件函数
-(void)createUI
{
    //定义并且创建一个UILabel对象
    //UILabel是可以显示在屏幕上，并且显示文字的一种UI视图
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(100, 200, 120, 50)];
    //设置label的控件文字
    label.text=@"Hello world!";
    /*
     //定义一个UILabel的对象
     UILabel *label=[[UILabel alloc]init];
     //设置label的显示位置
     lable.frame=CGRectMake(100,100,160,50);
     //d设置label的控件文字
     label.text=@"Hello world!";
     */
    //设置控件label的背景颜色
    label.backgroundColor=[UIColor redColor];
    //设置视图背景颜色
    self.view.backgroundColor=[UIColor yellowColor];
    //设置label文字的大小，使用系统默认字体，大小为12
    label.font=[UIFont systemFontOfSize:12];
       //设置字体的颜色
    label.textColor=[UIColor blueColor];
    //label的高级设置
    //设置阴影颜色
    label.shadowColor=[UIColor clearColor];
    //设置阴影的偏移位置
    label.shadowOffset=CGSizeMake(5,5);
    //设置文字的对齐方式，默认是左对齐
    label.textAlignment=NSTextAlignmentLeft;
    //设定label文字显示的行数，默认是1，只用一行来显示
    //其它行数，文字尽量按照设定行数来显示
    //如果设定值为0：ios会对文字计算所需行数，进而进行显示
    label.numberOfLines=0;
    //将label显示在屏幕上
    [self.view addSubview:label];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //调用UI函数
    [self createUI];
}


@end

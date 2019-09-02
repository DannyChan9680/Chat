//
//  ViewController.m
//  UIButton
//
//  Created by Civet on 2019/7/25.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//创建一个button函数
-(void)createUIRectButton
{
    //创建一个button对象
    //圆角类型button：UIButtonTypeRoundRect
    //通过类方法来创建buttonWithType：类名+方法名
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    //设置button按钮的位置
    button.frame=CGRectMake(100,100,100,50);
    //设置按钮的内容
    //@parameter
    //P1:字符串类型，显示到按钮上的文字
    //P2:z设置按钮显示的状态类型：UIControlStateNormal,正常状态
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    //P1:显示文字
    //P2:设置显示文字状态类型：UIControlStateHighLighted,按下状态
    [button setTitle:@"按下按钮" forState:UIControlStateHighlighted];
    //设置显示文字的颜色
    //P1:颜色
    //P2:状态
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //按下状态的颜色
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    //设置按钮的风格颜色
    [button setTintColor:[UIColor whiteColor]];
    //设置背景颜色
    button.backgroundColor=[UIColor grayColor];
    //titlelabel:UILabel的空间
    button.titleLabel.font=[UIFont systemFontOfSize:20];
    //添加到试图中显示
    [self.view addSubview:button];
}
//创建一个可以显示图片的按钮
-(void)crateImageButton
{   //创建自定义类型btn
    UIButton* btnImage=[UIButton buttonWithType:UIButtonTypeCustom];
    //设置按钮现实的位置
    btnImage.frame=CGRectMake(100,50,80,60);
    //添加按钮图片
    UIImage* icon01=[UIImage imageNamed:@"btn01.jpg"];
    UIImage* icon02=[UIImage imageNamed:@"btn01.jpg"];
    //设置按钮的状态
    [btnImage setImage:icon01 forState:UIControlStateNormal];
    [btnImage setImage:icon02 forState:UIControlStateHighlighted];
    //将按钮显示在视图中
    [self.view addSubview:btnImage];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //调用定义函数
    [self createUIRectButton];
    [self crateImageButton];
}


@end

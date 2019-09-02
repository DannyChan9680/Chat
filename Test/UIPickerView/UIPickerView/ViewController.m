//
//  ViewController.m
//  UIPickerView
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
    //创建选择图像对象
    UIPickerView * picker=[[UIPickerView alloc] initWithFrame:CGRectMake(20, 100, 350, 350)];
    //设置普通代理对象作为当前的视图控制器
    picker.delegate=self;
    //设置数据代理对象为当前视图控制器
    picker.dataSource=self;
    
    [self.view addSubview:picker];
}
//实现获取组数的协议函数 ，返回值为选择视图的组数
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
//实现每组元素的个数，返回值为元素的个数
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //设置每组元素的不一样的个数
     if(component==0)
     {
         return 5;
     }
    else if(component==1)
    {
        return 10;
    }
    else if(component==2)

    {
        return 20;
    }
        return 10;
}
//显示每个元素的内容
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString * str=[NSString stringWithFormat:@"%lu组%lu行",component+1,row+1];
    
    return str;
}
-(CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 80;
}
-(CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 20;
}
//将自定义的视图显示在屏幕上
-(UIView*) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImage* image=[UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(row)%7+1]];
    UIImageView* iView=[[UIImageView alloc] initWithImage:image];
    
    iView.frame=CGRectMake(0, 0, 80, 80);
    
    return iView;
}
@end

//
//  VCRoot.m
//  导航控制器基础
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor greenColor];
    //设置根视图标题文字
    self.title=@"根视图";
    //设置导航元素项目标题，如果该设置为空，则系统将会使用self.title作为标题，如果不为空，则使用navigationItem.title的值作为标题
    self.navigationItem.title=@"Title";
    //创建一个导航对象，左侧按钮
    //根据title文字来创建按钮
    //p1:按钮上的文字
    //p2:按钮风格
    //p3:时间拥有者
    //p4:按钮事件
    UIBarButtonItem* leftBtn=[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //将导航元素项的左侧按钮赋值
    self.navigationItem.leftBarButtonItem=leftBtn;
    //创建右侧按钮，参数1为按钮风格，参数2为时间拥有者，参数3为按钮事件
    //根据系统风格来创建按钮，只需要指定风格样式，系统风格的按钮内容或者标题文字不能改变
    UIBarButtonItem* rightBtn=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(pressRight)];
    self.navigationItem.rightBarButtonItem=rightBtn;
    //设置标签对象
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 80, 40)];
    label.text=@"test";
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor redColor];
    //将任何类型的控件添加导航按钮的方法
    UIBarButtonItem * item03=[[UIBarButtonItem alloc] initWithCustomView:label];
    //创建按钮数组
    NSArray* arrayBtn=[NSArray arrayWithObjects:rightBtn,item03, nil];
    //将右侧按钮数组赋值
   self.navigationItem.rightBarButtonItems= arrayBtn;
    
    
}
-(void)pressLeft
{
    NSLog(@"左侧按钮按下");
}
-(void)pressRight
{
    NSLog(@"右侧按钮按下");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

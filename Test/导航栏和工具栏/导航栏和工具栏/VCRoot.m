//
//  VCRoot.m
//  导航栏和工具栏
//
//  Created by Civet on 2019/7/30.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCRoot.h"
#import "VCSecond.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor orangeColor];
    //设置导航栏风格颜色
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    //将导航风格设置成不透明
    self.navigationController.navigationBar.translucent=NO;
    
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
    
    self.navigationController.navigationBar.tintColor=[UIColor yellowColor];
    
    //隐藏导航栏
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBarHidden=NO;
    self.title=@"根视图";
    
    UIBarButtonItem* btn=[[UIBarButtonItem alloc] initWithTitle:@"右侧按钮" style:UIBarButtonItemStylePlain target:self action:nil];
    
    self.navigationItem.rightBarButtonItem=btn;
    
    
    //实现工具栏对象
    self.navigationController.toolbarHidden=NO;
    self.navigationController.toolbar.translucent=NO;
    //v创建三个工具栏按钮
    UIBarButtonItem* btn01=[[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIBarButtonItem* btn02=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(pressNext) ];
    UIButton * btnIamge=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btnIamge setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    
    btnIamge.frame=CGRectMake(0, 0, 60, 60);
    
    UIBarButtonItem * btn03=[[UIBarButtonItem alloc] initWithCustomView:btnIamge];
    
    UIBarButtonItem* btnF01=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    btnF01.width=30;
    //创建自动计算宽度
    UIBarButtonItem * btnF02=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //按钮数组的创建
    NSArray * arrayBtns=[NSArray arrayWithObjects:btn01,btn02,btn03,btnF01,btnF02, nil];
    
    self.toolbarItems=arrayBtns;
    
}
-(void) pressNext
{
    VCSecond* vc=[[VCSecond alloc] init];
    
    [self.navigationController pushViewController:vc  animated:YES];
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

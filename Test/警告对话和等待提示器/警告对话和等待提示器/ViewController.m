//
//  ViewController.m
//  警告对话和等待提示器
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController
@synthesize alertView=_alertView;
@synthesize activityINdicater=_activityIndicater;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for(int i=0;i<2;i++)
    {
        UIButton* btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame=CGRectMake(100, 100+100*i, 100, 40);
        
        if(i==0)
        {
            [btn setTitle:@"警告对话！" forState:UIControlStateNormal];
            
        }
        else if(i==1)
        {
            [btn setTitle:@"等待提示！" forState:UIControlStateNormal];
        }
        btn.tag=101+i;
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

-(void)pressBtn:(UIButton*) btn
{
    if(btn.tag==101)
    {
        //创建警告对话框
        //P3:处理按钮事件的代理对象
        _alertView=[[UIAlertView alloc] initWithTitle:@"警告" message:@"你的手机电量过低，即将关机，请保存好数据" delegate:self cancelButtonTitle:@"取消"otherButtonTitles:@"ok", @"12",nil];
        //显示对话框
        [_alertView show];
    }
   else if (btn.tag==102)
    {
        _activityIndicater=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 100, 60, 50)];
        
        _activityIndicater.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
        
        self.view.backgroundColor=[UIColor orangeColor];
        
        [self.view addSubview:_activityIndicater];
        
        [_activityIndicater startAnimating];
        
    }
}
//对话框调用函数
-(void)AlertView: (UIAlertView *)alertView clickedButtonAtIndex:(NSInteger) buttonIndex
{
    NSLog(@"index =%ld\n",buttonIndex);
}
//对话框即将消失
-(void)AlertView: (UIAlertView *)alertView willDismissWithButtonIndex:(NSUInteger) buttonIndex
{
    NSLog(@"即将消失");
}
//对话框已经消失
-(void)AlertView: (UIAlertView *)alertView didDismissWithButtonIndex:(NSUInteger) buttonIndex
{
    NSLog(@"已经消失");
}@end


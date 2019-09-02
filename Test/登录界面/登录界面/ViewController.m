//
//  ViewController.m
//  登录界面
//
//  Created by Civet on 2019/7/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建用户名提示标签
    _lbUserName=[[UILabel alloc] init];
    _lbUserName.frame=CGRectMake(20, 60, 80, 40);
    _lbUserName.text=@"用户名：";
    _lbUserName.font=[UIFont systemFontOfSize:10];
    _lbUserName.textAlignment=NSTextAlignmentLeft;
    
    //用户密码提示
    _lbPassWord=[[UILabel alloc] init];
    _lbPassWord.frame=CGRectMake(20, 140, 80, 40);
    _lbPassWord.text=@"密码：";
    _lbPassWord.font=[UIFont systemFontOfSize:10];
    _lbPassWord.textAlignment=NSTextAlignmentLeft;
    
    //用户名输入框
    _tfUserName=[[UITextField alloc] init];
    _tfUserName.frame=CGRectMake(120, 60, 80, 40);
    _tfUserName.placeholder=@"请输入用户名";
    _tfUserName.borderStyle=UITextBorderStyleRoundedRect;
    
    //密码输入、
    _tfPassWord=[[UITextField alloc] init];
    _tfPassWord.frame=CGRectMake(120, 140, 80, 40);
    _tfPassWord.placeholder=@"请输入密码";
    _tfPassWord.borderStyle=UITextBorderStyleRoundedRect;
    _tfPassWord.secureTextEntry=YES;
    
    //登录和注册按钮创建
    _btLogin=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btLogin.frame=CGRectMake(120, 300, 80, 40);
    [_btLogin setTitle:@"登录" forState:UIControlStateNormal];
    [_btLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    _btRegidster=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btRegidster.frame=CGRectMake(120, 350, 80, 40);
    [_btRegidster setTitle:@"注册" forState:UIControlStateNormal];
    [_btRegidster addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    //显示所有控件
    [self.view addSubview:_lbUserName];
    [self.view addSubview:_lbPassWord];
    [self.view addSubview:_tfUserName];
    [self.view addSubview:_tfPassWord];
    [self.view addSubview:_btLogin];
    [self.view addSubview:_btRegidster];
                 
                 
}
-(void)pressLgin
{
    NSString * strName=@"DannyChan";
    NSString* strPass=@"12345";
    
    //获取输入框中的用户名文字
    NSString* strTextName=_tfUserName.text;
    NSString* strTextPass=_tfPassWord.text;
    
    if([strName isEqualToString:strTextName]&&[strPass isEqualToString:strTextPass])
    {
        NSLog(@"用户名密码正确");
        UIAlertView* alView=[[UIAlertView alloc] initWithTitle:@"提示" message:@"验证成功，登录成功" delegate:nil
                                             cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alView show];
    }
    else
    {
        UIAlertView* alView=[[UIAlertView alloc] initWithTitle:@"提示" message:@"验证失败,用户名或者密码错误" delegate:nil  cancelButtonTitle:@"确认" otherButtonTitles:nil];
        [alView show];
    }
}
-(void)pressRegister
{
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //回收键盘对象
    [_tfUserName resignFirstResponder];
    [_tfPassWord resignFirstResponder];
}
@end

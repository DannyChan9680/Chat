//
//  SignUpViewController.m
//  Chat
//
//  Created by Civet on 2019/8/20.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "FirebaseAuth.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //注册页面
    [self.navigationItem setTitle:@"注册"];
    //控件
    
    UILabel *email = [[UILabel alloc]initWithFrame:CGRectMake(70, 100, 80, 30)];
    email.text = @"邮箱";
    email.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:email];
    [email release];
    
    _emailTextField= [[UITextField alloc]initWithFrame:CGRectMake(150, 100, 140, 30)];
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    _emailTextField.placeholder = @"请输入正确邮箱";
    _emailTextField.delegate = self;//添加代理
    [self.view  addSubview:_emailTextField];
    [_emailTextField  release];
    
    UILabel *passwordLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(70, 160, 80, 30)];
    passwordLabel1.text = @"密 码";
    passwordLabel1.textAlignment = NSTextAlignmentLeft;
    [self.view   addSubview:passwordLabel1];
    [passwordLabel1 release];
    
    _passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(150, 160, 140, 30)];
    _passwordTextField .borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField .placeholder = @"请输入密码";
    _passwordTextField .secureTextEntry = YES;//设置密文
    _passwordTextField .delegate = self;//添加代理
    [self.view   addSubview:_passwordTextField ];
    [_passwordTextField  release];
    
    UILabel *confirmPwd = [[UILabel alloc]initWithFrame:CGRectMake(70, 220, 80, 30)];
    confirmPwd.text = @"确认密码";
    confirmPwd.textAlignment = NSTextAlignmentLeft;
    [self.view   addSubview:confirmPwd];
    [confirmPwd release];
    
    _passwordTextField1 = [[UITextField alloc]initWithFrame:CGRectMake(150, 220, 140, 30)];
    _passwordTextField1.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField1.placeholder = @"再次输入密码";
    _passwordTextField1.secureTextEntry = YES;
    _passwordTextField1.delegate = self;//添加代理
    [self.view   addSubview:_passwordTextField1];
    [_passwordTextField1 release];
    
    UIButton *reibutton = [UIButton buttonWithType:UIButtonTypeSystem];
    reibutton.frame = CGRectMake(170, 300, 80, 30);
    [reibutton setTitle:@"注册" forState:UIControlStateNormal];
    //添加点击事件
    [reibutton addTarget:self action:@selector(registers:) forControlEvents:UIControlEventTouchUpInside];
    [self.view   addSubview:reibutton];
}
//设置注册页面的注册按钮点击事件,验证是否注册成功
-(void)registers:(UIButton *)button{
    [[FIRAuth auth] createUserWithEmail:_emailTextField.text
                               password:_passwordTextField.text
                             completion:^(FIRAuthDataResult * _Nullable authResult,
                                          NSError * _Nullable error) {
                                 if(error==nil)
                                 {
                                     UIAlertView *checkView1 = [[UIAlertView alloc]initWithTitle:@"提示" message:@"恭喜你注册成功" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                                        [checkView1 show];
                                 }
                                 else{
      
                                           UIAlertView *checkView2 = [[UIAlertView alloc]initWithTitle:@"提示" message:@"邮箱和密码不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                                            [checkView2 show];
                                }
                             }];
    
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

//
//  LoginViewController.m
//  ChatChat
//
//  Created by Civet on 2019/8/21.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "FinePasswordViewController.h"
#import "ChatUserTableViewController.h"
#import "Firebase.h"
#import "FirebaseAuth.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
}
-(void)viewDidAppear:(BOOL)animated
{
    //登录界面
    [self.navigationItem setTitle:@"登录"];
    UIView *containView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    containView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:containView];
    [containView release];
    
    UILabel *emailLable = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, 80, 30)];
    emailLable .text = @"邮箱";
    emailLable .textAlignment = NSTextAlignmentCenter;
    [containView addSubview:emailLable];
    [emailLable  release];
    
    _emailTextField = [[UITextField alloc]initWithFrame:CGRectMake(130, 200, 240, 30)];
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    _emailTextField.placeholder = @"请输入邮箱";
    _emailTextField.delegate = self;//添加代理
    
    [containView addSubview:_emailTextField];
    [_emailTextField release];
    UILabel *passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 260, 80, 30)];
    passwordLabel.text = @"密 码";
    passwordLabel.textAlignment = NSTextAlignmentCenter;
    [containView addSubview:passwordLabel];
    [passwordLabel release];
    
    _passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(130, 260, 240, 30)];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField .placeholder = @"请输入密码";
   _passwordTextField .delegate = self;//设置代理
    // pdTextField.text = @'password';//设置默认的密码
    _passwordTextField .secureTextEntry = YES;
    [containView addSubview:_passwordTextField ];
    [_passwordTextField  release];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    loginButton.frame = CGRectMake(130, 330, 75, 30);
    [loginButton setTitle:@"登录"forState:UIControlStateNormal];
    //为loginButton添加登录事件
    [loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [containView addSubview:loginButton];
    UIButton *registersButton = [UIButton buttonWithType:UIButtonTypeSystem];
    registersButton.frame = CGRectMake(160, 400, 75, 30);
    [registersButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [registersButton addTarget:self action:@selector(findPassword:) forControlEvents:UIControlEventTouchUpInside];
    [containView addSubview:registersButton];
    UIButton * resertButton= [UIButton buttonWithType:UIButtonTypeSystem];
    resertButton.frame = CGRectMake(180, 330, 75, 30);
    [resertButton setTitle:@"注册" forState:UIControlStateNormal];
    [resertButton addTarget:self action:@selector(regist:) forControlEvents:UIControlEventTouchUpInside];
    [containView addSubview:resertButton];
}
//登录界面设置键盘回收
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //取消第一响应者
    [textField resignFirstResponder];
    return YES;
}
//设置登录界面的登录事件,验证登录是否成功
-(void)login:(UIButton *)button{

        [[FIRAuth auth] signInWithEmail:self->_emailTextField.text
                               password:self->_passwordTextField.text
                             completion:^(FIRAuthDataResult * _Nullable authResult,
                                          NSError * _Nullable error) {
                                 if(error==nil)
                                 {
                                     //跳转聊天用户界面
                                     ChatUserTableViewController *userController = [[ChatUserTableViewController alloc] init];
                                     //如果包含导航栏的话，需要使用如下方式进行界面跳转；不能使用presentViewController进行跳转;
                                     [self.navigationController pushViewController:userController animated:true];
                                 }
                                   else {
                                             UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"错误提示" message:@"请输入邮箱和密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                                            [alert show];
                                        }
                             }];
 
}

//设置登录页面的找回密码按钮事件,点击找回密码,跳到找回密码页面
-(void)findPassword:(UIButton *)button{
    //要跳转查找密码界面；
   FinePasswordViewController *finepasswordController = [[FinePasswordViewController alloc] init];
    //如果包含导航栏的话，需要使用如下方式进行界面跳转；不能使用presentViewController进行跳转;
    [self.navigationController pushViewController:finepasswordController animated:true];
}
//设置登录页面的注册按钮事件,跳到注册页面
-(void)regist:(UIButton *)button{
     //[self presentViewController:[[RegisterViewController alloc] init] animated:true completion:nil];
    //要跳转注册界面；
    RegisterViewController *registerController = [[RegisterViewController alloc] init];
    //如果包含导航栏的话，需要使用如下方式进行界面跳转；不能使用presentViewController进行跳转;
    [self.navigationController pushViewController:registerController animated:true];

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

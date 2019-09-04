//
//  FinePasswordViewController.m
//  Chat
//
//  Created by Civet on 2019/8/21.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import "FinePasswordViewController.h"
#import "LoginViewController.h"
#import "FirebaseAuth.h"
@interface FinePasswordViewController ()

@end

@implementation FinePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //找回密码页面
      [self.navigationItem setTitle:@"找回密码"];
    //控件
    _emailTextField= [[UITextField alloc] initWithFrame:CGRectMake(90, 220, 180, 30)];
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    _emailTextField.placeholder = @"请输入电子邮箱";
    [self.view addSubview:_emailTextField];
    [_emailTextField release];
    
    UIButton *finon = [UIButton buttonWithType:UIButtonTypeSystem];
    finon.frame = CGRectMake(100, 280, 40, 30);
    [finon setTitle:@"找回" forState:UIControlStateNormal];
    [finon addTarget:self action:@selector(FinePassword:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:finon];
    
}
-(void) FinePassword:(UIButton* )btn
{
    if(_emailTextField.text==nil)
    {
        UIAlertView * alert1=[[UIAlertView alloc] initWithTitle:@"错误" message:@"邮箱不能为空" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert1 show];
    }
    else{
        [[FIRAuth auth] sendPasswordResetWithEmail:_emailTextField.text completion:^(NSError * _Nullable error) {
            if(error !=nil)
            {
                UIAlertView * alert2=[[UIAlertView alloc] initWithTitle:@"错误" message:@"邮箱错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alert2 show];
            }
            else{
                UIAlertView * alert3=[[UIAlertView alloc] initWithTitle:@"成功" message:@"已发送至你的邮箱" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                _emailTextField.text=nil;
                [alert3 show];
            }
        }];
    }
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end

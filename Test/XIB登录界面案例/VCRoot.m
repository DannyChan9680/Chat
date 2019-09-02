//
//  VCRoot.m
//  XIB登录界面案例
//
//  Created by Civet on 2019/7/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)pressLogin:(UIButton*)sender
{
    NSString* uName=@"DannyChan";
    NSString * uPass=@"123456";
    
    if([_mTFUserName.text isEqual:uName]&&[_mTFUserPassword.text isEqual:uPass])
    {
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名密码正确，登录成功"delegate:self                                 cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或密码错误，登录失败"delegate:self                                 cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_mTFUserName resignFirstResponder];
    [_mTFUserPassword resignFirstResponder];
}
-(IBAction)pressRegister:(id)sender
{
}
@end

//
//  ViewController.m
//  UITextFiled
//
//  Created by Civet on 2019/7/26.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textField=_textField;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //差UN关键文本输入区
    self.textField=[[UITextField alloc] init];
    
    self.textField.frame=CGRectMake(100, 100, 60, 60);
    
    self.textField.text=@"用户名";
    
    self.textField.font=[UIFont systemFontOfSize:15];
    
    self.textField.textColor=[UIColor blackColor];
    
    self.textField.borderStyle=UIKeyboardTypeNumberPad;
    
    self.textField.placeholder=@"请输入用户名 ";
    
    self.textField.secureTextEntry=NO;
    
    
}


@end

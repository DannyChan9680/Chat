//
//  ViewController.h
//  登录界面
//
//  Created by Civet on 2019/7/29.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    //登录界面组成
    //用户提示、密码提示、登录按钮、注册按钮
    UILabel *   _lbUserName;
    UILabel*    _lbPassWord;
    
    UITextField*   _tfUserName;
    UITextField*  _tfPassWord;
    
    UIButton*    _btLogin;
    UIButton*    _btRegidster;
}

@end


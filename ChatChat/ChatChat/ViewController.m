//
//  ViewController.m
//  ChatChat
//
//  Created by Civet on 2019/8/21.
//  Copyright © 2019 limeixiang. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
@interface ViewController ()

@end

@implementation ViewController

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    LoginViewController * loginView=[[LoginViewController alloc] init];
    [self presentViewController:loginView animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end

//
//  VCSecond.m
//  多界面传值
//
//  Created by Civet on 2019/7/31.
//  Copyright © 2019 yanghao. All rights reserved.
//

#import "VCSecond.h"

@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建时间按钮
    UIBarButtonItem* btnChange=[[UIBarButtonItem alloc] initWithTitle:@"改变颜色" style:UIBarButtonItemStyleDone target:self action:@selector(pressChange)];
    
    self.navigationItem.rightBarButtonItem=btnChange;
}
//点击按钮时，触发代理事件
-(void) pressChange
{
    //代理对象调用事件函数
    [_delegate changeColor:[UIColor greenColor]];
    
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
